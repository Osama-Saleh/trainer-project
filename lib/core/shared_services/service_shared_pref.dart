import 'package:shared_preferences/shared_preferences.dart';

class ServiceSharedPref {
  static Future setBoolData({
    required String key,
    required bool value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<bool?> getBoolData({
    required String key,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
  static Future clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
