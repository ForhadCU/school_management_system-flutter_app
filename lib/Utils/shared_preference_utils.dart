import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

Future<String?> testSaveString(String key, String value) async {
  // if (prefs == null) prefs = await SharedPreferences.getInstance();
  prefs ?? await SharedPreferences.getInstance();
  await prefs?.setString(key, value);
  return value;
}

saveInt(String key, int value) async {
  // if (prefs == null) prefs = await SharedPreferences.getInstance();
  prefs ?? await SharedPreferences.getInstance();
  prefs?.setInt(key, value);
}

Future<String?> testGetString(String key) async {
  // if (prefs == null) prefs = await SharedPreferences.getInstance();
  prefs ?? await SharedPreferences.getInstance();
  return prefs?.getString(key);
}
