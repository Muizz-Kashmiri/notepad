// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:notepad/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../my.i18n.dart';

String selectedFont = '';
String selectedLanguage = '';
String selectedCountry = '';

double initFontValue = 17.0;

/// Settings screen.
class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<bool> _onWillPop() async {
    return Phoenix.rebirth(context);
  }

  Widget checkForAd() {
    if (isLoaded == true) {
      return StatefulBuilder(
        builder: (context, setState) => Container(
          child: AdWidget(
            ad: ad,
          ),
          width: ad.size.width.toDouble(),
          alignment: Alignment.center,
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    print(light);
    lightF = prefs.getBool('theme');
    light = await lightF;
  }

  onSwitchValueChanged(bool newVal) {
    setState(() {
      light = newVal;
      saveTheme(light);
      Phoenix.rebirth(context);
    });
  }

  ///method to save value in shared preferences
  saveFontFamily(String stringValue) async {
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    sharedPre.setString('fontFamilyVar', stringValue);
    //   print(stringValue);
  }

  saveLanguage(String stringValue) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('language', stringValue);
    //   print(stringValue);
  }

  saveTheme(bool stringValue) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool('theme', stringValue);
    //   print(stringValue);
  }

  saveCountry(String stringValue) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString('country', stringValue);
    //   print(stringValue);
  }

  saveFontSize(double intValue) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setDouble('font', intValue);
    //   print(stringValue);
  }

  void initState() {
    super.initState();
    getTheme();
    if (initFontValue == null) {
      initFontValue = 17;
    }
    ;
    if (selectedFont == '') {
      selectedFont = 'Roboto';
    }
    ;
    ad.load();

    print('i started here in settings size is $initFontValue');
  }

  void dispose() {
    super.dispose();
    //print('i ended');
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: Theme.of(context).textTheme.caption.copyWith(
                      //color: Colors.blueAccent.shade400,
                      fontWeight: FontWeights.medium,
                    ),
              ),
        ),
        child: Builder(
          builder: (context) => new WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              appBar: AppBar(
                // backgroundColor: Colors.transparent,
                title: Center(
                    child: Text(
                  settings.i18n,
                  style:
                      TextStyle(color: Colors.black, fontFamily: selectedFont),
                )),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ListTile(
                      title: Text(
                        language.i18n,

                        //   style: whiteBoldText,
                      ),
                      subtitle: Text(
                        "Locale: ${I18n.locale}",
                        //  style: greyTExt,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey.shade400,
                      ),
                      onTap: () {
                        setState(() {
                          return generateAlertLanguage(context);
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ListTile(
                      title: Text(
                        fontfam.i18n,
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                      leading: Icon(
                        Icons.font_download,
                        color: Colors.black,
                      ),
                      trailing: GestureDetector(
                        child: Text(
                          selectedFont,
                          style: TextStyle(
                            fontSize: initFontValue,
                            // color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          return generateAlertFont(context);
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ListTile(
                      title: Text(
                        fontsize.i18n,
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                      leading: Icon(
                        Icons.format_size,
                        color: Colors.black,
                      ),
                      trailing: Text(
                        '$initFontValue',
                        style: TextStyle(fontSize: initFontValue),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    //Todo slider changing
                    Slider(
                        value: initFontValue,
                        min: 17.0,
                        max: 32,
                        onChanged: (double newValue) {
                          setState(() {
                            initFontValue = newValue.roundToDouble();
                            saveFontSize(initFontValue);
                          });
                        }),
                    const SizedBox(height: 20.0),
                    ListTile(
                      title: Text(
                        nightmode.i18n,
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                      leading: Icon(
                        Icons.nightlight_round,
                        color: Colors.black,
                      ),
                      trailing: Switch(
                        value: light,
                        onChanged: (newVal) {
                          onSwitchValueChanged(newVal);
                        },
                      ),

                      // ToggleSwitch(
                      //   minWidth: 30.0,
                      //   minHeight: 25.0,
                      //   cornerRadius: 20.0,
                      //   activeBgColors: [
                      //     [Colors.green[800]],
                      //     [Colors.red[800]]
                      //   ],
                      //   activeFgColor: Colors.white,
                      //   inactiveBgColor: Colors.grey,
                      //   inactiveFgColor: Colors.white,
                      //   initialLabelIndex: 0,
                      //   totalSwitches: 2,
                      //   radiusStyle: true,
                      //   onToggle: (index) {
                      //     //   setState(() {
                      //     //     if (index == 0) {
                      //     //       AD = false;
                      //     //     } else {
                      //     //       AD = true;
                      //     //     }
                      //     //   });
                      //   },
                      // ),
                      // onTap: () {},
                    ),

                    const SizedBox(height: 20.0),

                    ListTile(
                      title: Text(
                        rate.i18n,
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                      leading: Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20.0),

                    ListTile(
                      title: Text(
                        privacy.i18n,
                        style: TextStyle(fontFamily: selectedFont),
                        //   style: whiteBoldText,
                      ),
                      leading: Icon(
                        Icons.privacy_tip,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20.0),

                    ListTile(
                      title: Text(
                        contact.i18n,
                        style: TextStyle(fontFamily: selectedFont),
                        //   style: whiteBoldText,
                      ),
                      leading: Icon(
                        Icons.contacts,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20.0),
                    //TODO: tjos add
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  void generateAlertLanguage(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(child: Text(changeLanguage.i18n)),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      enabled: true,
                      //    selectedFont = 'Roboto';
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'en';
                          selectedCountry = 'US';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          Phoenix.rebirth(context);
                          //Navigator.popUntil(context, (route) => route.isFirst);
                        });
                      },
                      title: Text(
                        'English',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //english
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'pt';
                          selectedCountry = 'BR';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Portuguese',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //portuguese
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'ur';
                          selectedCountry = 'UR';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Urdu',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //urdu
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'ar';
                          selectedCountry = 'AE';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'عَرَبِيّ',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //arabic
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'ru';
                          selectedCountry = 'RU';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'русский',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //russian
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'hi';
                          selectedCountry = 'IN';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'हिंदी',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //hindi
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'it';
                          selectedCountry = 'IT';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Italian',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //italian
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'fr';
                          selectedCountry = 'FR';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Français',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //french
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'de';
                          selectedCountry = 'DE';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Deutsche',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //german
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'nl';
                          selectedCountry = 'BE';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Dutch',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //dutch belgium
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'id';
                          selectedCountry = 'ID';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Indonesian',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //indonesian
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'ms';
                          selectedCountry = 'MY';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Malay',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //malay malaysia
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'pl';
                          selectedCountry = 'PL';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Polskie',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //polish
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'es';
                          selectedCountry = 'ES';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        'Español',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //spanish
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'ko';
                          selectedCountry = 'KO';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        '한국어',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //korean
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'ja';
                          selectedCountry = 'JA';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        '日本',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //japanese
                    ListTile(
                      enabled: true,
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'zh';
                          selectedCountry = 'CN';
                          saveLanguage(selectedLanguage);
                          saveCountry(selectedCountry);
                          saveLanguage(selectedLanguage);
                          Phoenix.rebirth(context);
                        });
                      },
                      title: Text(
                        '中国人',
                        style: TextStyle(fontFamily: selectedFont),
                      ),
                    ), //chinese
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void generateAlertFont(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'Select Fonts',
          style: TextStyle(fontFamily: selectedFont),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          ListTile(
            enabled: true,
            //    selectedFont = 'Roboto';
            onTap: () {
              setState(() {
                selectedFont = 'Roboto';
                saveFontFamily(selectedFont);
                Phoenix.rebirth(context);
                //Navigator.popUntil(context, (route) => route.isFirst);
              });
            },
            title: Text(
              'Roboto',
              style: TextStyle(fontFamily: 'Roboto'),
            ),
          ),
          ListTile(
            enabled: true,
            //    selectedFont = 'Roboto';
            onTap: () {
              setState(() {
                selectedFont = 'StyleScript';
                saveFontFamily(selectedFont);
                Phoenix.rebirth(context);
                //Navigator.popUntil(context, (route) => route.isFirst);
              });
            },
            title: Text(
              'StyleScript',
              style: TextStyle(fontFamily: 'StyleScript'),
            ),
          ),
          ListTile(
            enabled: true,
            onTap: () {
              setState(() {
                selectedFont = 'STIXTwoText';
                saveFontFamily(selectedFont);
                Phoenix.rebirth(context);
                //Navigator.popUntil(context, (route) => route.isFirst);
              });
            },
            title: Text(
              'Stix Two Text',
              style: TextStyle(fontFamily: 'STIXTwoText'),
            ),
          ),
          ListTile(
            enabled: true,
            //    selectedFont = 'Roboto';
            onTap: () {
              setState(() {
                selectedFont = 'ReemKufi';
                saveFontFamily(selectedFont);
                Phoenix.rebirth(context);
                //Navigator.popUntil(context, (route) => route.isFirst);
              });
            },
            title: Text(
              'ريم كوفي',
              style: TextStyle(fontFamily: 'ReemKufi'),
            ),
          ),
        ],
      ),
    );
  }

// void _signOut(BuildContext context) async {
//   final yes = await showDialog<bool>(
//     context: context,
//     builder: (context) => AlertDialog(
//       content: const Text('Are you sure to sign out the current account?'),
//       actions: <Widget>[
//         FlatButton(
//           child: const Text('No'),
//           onPressed: () => Navigator.pop(context, false),
//         ),
//         FlatButton(
//           child: const Text('Yes'),
//           onPressed: () => Navigator.pop(context, true),
//         ),
//       ],
//     ),
//   );
//
//   if (yes) {
//     FirebaseAuth.instance.signOut();
//     Navigator.pop(context);
//   }
// }
}
