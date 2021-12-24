import 'package:shared_preferences/shared_preferences.dart';


Future<String> getThemeFromSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  return sharedPref.getString('theme');
}

void setThemeinSharedPref(String val) async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sharedPref.setString('theme', val);
}

class LangPreferences {
  static SharedPreferences _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future saveLanguage(String stringValue) async =>
      await _preferences.setString('language', stringValue);

  static String getLanguage() => _preferences.getString('language');

  static Future saveCountry(String stringValue) async =>
      await _preferences.setString('country', stringValue);

  static String getCountry() => _preferences.getString('country');

  static Future saveAD(bool stringValue) async =>
      await _preferences.setBool('ADpref', stringValue);

  static bool getAD() => _preferences.getBool('ADpref');
}
