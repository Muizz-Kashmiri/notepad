import 'dart:async';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:notepad/screen/settings_screen.dart';
import 'package:notepad/service/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models.dart' show CurrentUser;
import 'screens.dart' show HomeScreen, LoginScreen, NoteEditor, SettingsScreen;
import 'styles.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

double resultFontSize = 8.0;
String resultFont = '';
String resultLanguage = '';
String resultCountry = '';
bool light = false;
bool lightF = false;
bool isLoaded;
BannerAd ad;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  await LangPreferences.init();
  runApp(Phoenix(child: NotesApp()));
}

Widget checkForAd() {
  if (isLoaded == true) {
    return Container(
      child: AdWidget(
        ad: ad,
      ),
      width: ad.size.width.toDouble(),
      alignment: Alignment.center,
    );
  } else {
    return CircularProgressIndicator();
  }
}

class NotesApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  Future loadData() async {
    getFontSize();
    getFontFamily();
    getTheme();
  }

  /// get data from shared preferences
  getFontFamily() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    resultFont = prefs.getString('fontFamilyVar') ?? '';
    selectedFont = await resultFont;
  }

  Future getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lightF = prefs.getBool('theme') ?? false;
    light = await lightF;
  }

  getFontSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    resultFontSize = prefs.getDouble('font');
    initFontValue = await resultFontSize;
  }

  Future getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    resultLanguage = prefs.getString('language') ?? 'en';
    selectedLanguage = await resultLanguage;
    print('the saved lang is $resultCountry');
  }

  void initState() {
    loadData();
    super.initState();
    if (light == null) {
      light = false;
    }
    ;
    selectedLanguage = LangPreferences.getLanguage() ?? 'en';
    selectedCountry = LangPreferences.getCountry() ?? 'US';
    ad = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(
            () {
              isLoaded = true;
            },
          );
        },
        onAdFailedToLoad: (_, error) {
          print('Ad failed to load with error $error');
        },
      ),
    );
    ad.load();
  }

  @override
  void dispose() {
    super.dispose();
    ad?.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamProvider.value(
        value: FirebaseAuth.instance
            .authStateChanges()
            .map((user) => CurrentUser.create(user)),
        initialData: CurrentUser.initial,
        child: Consumer<CurrentUser>(
          builder: (context, user, _) => MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', "US"), //english
              const Locale('pt', "BR"), //portuguese
              const Locale('ur', "UR"), //urdu
              const Locale('ar', "AE"), //arabic
              const Locale('ru', "RU"), //russian
              const Locale('hi', "IN"), //hindi
              const Locale('it', "IT"), //italian
              const Locale('fr', "FR"), //french
              const Locale('de', "DE"), //german
              const Locale('nl', "BE"), //dutch belgium
              const Locale('id', "ID"), //indonesian
              const Locale('ms', "MY"), //malay malaysia
              const Locale('pl', "PL"), //polish
              const Locale('es', "ES"), //spanish
              const Locale('ko', "KO"), //korean
              const Locale('ja', "JA"), //japanese
              const Locale('zh', "CN"), //chinese
            ],
            title: 'NotePad',

            theme: light ? lightTheme : darkTheme,
            // darkTheme: darkTheme,
            home: user.isInitialValue
                ? I18n(
                    initialLocale: Locale(selectedLanguage, selectedCountry),
                    child: Scaffold(body: const SizedBox()))
                : user.data != null
                    ? I18n(
                        initialLocale:
                            Locale(selectedLanguage, selectedCountry),
                        child: HomeScreen(),
                      )
                    : I18n(
                        initialLocale:
                            Locale(selectedLanguage, selectedCountry),
                        child: LoginScreen(),
                      ),
            routes: {
              '/settings': (_) => SettingsScreen(),
            },
            onGenerateRoute: _generateRoute,
          ),
        ),
      );

  /// Handle named route
  Route _generateRoute(RouteSettings settings) {
    try {
      return _doGenerateRoute(settings);
    } catch (e, s) {
      debugPrint("failed to generate route for $settings: $e $s");
      return null;
    }
  }

  Route _doGenerateRoute(RouteSettings settings) {
    if (settings.name?.isNotEmpty != true) return null;

    final uri = Uri.parse(settings.name);
    final path = uri.path ?? '';
    // final q = uri.queryParameters ?? <String, String>{};
    switch (path) {
      case '/note':
        {
          final note = (settings.arguments as Map ?? {})['note'];
          return _buildRoute(settings, (_) => NoteEditor(note: note));
        }
      default:
        return null;
    }
  }

  /// Create a [Route].
  Route _buildRoute(RouteSettings settings, WidgetBuilder builder) =>
      MaterialPageRoute<void>(
        settings: settings,
        builder: builder,
      );

  ThemeData darkTheme = ThemeData(fontFamily: selectedFont).copyWith(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme().copyWith(
      elevation: 0,
      backgroundColor: Colors.white10,
      foregroundColor: Colors.black,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: kIconTintLight,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: kBottomAppBarColorLight,
    primaryTextTheme: TextTheme().copyWith(
      // title
      headline6: const TextStyle(
        color: kIconTintLight,
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: kAccentColorLight),
  );

  ThemeData lightTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Color(0XFF303030),
    appBarTheme: AppBarTheme().copyWith(
      elevation: 0,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.white),
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: kIconTintLight,
      ),
    ),
    backgroundColor: Color(0XFF303030),
    scaffoldBackgroundColor: Color(0XFF303030),
    bottomAppBarColor: kBottomAppBarColorDark,
    primaryTextTheme: TextTheme().copyWith(
      headline6: const TextStyle(
        color: kIconTintLight,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColorDark),
  );
}
