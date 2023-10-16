import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static final CacheManager _singleton = CacheManager._internal();

  factory CacheManager() {
    return _singleton;
  }

  CacheManager._internal();

  static const String themeKey = 'theme';
  static const String isFirstTimeKey = 'isFirstTime';

  Future<void> setTheme(String theme) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(themeKey, theme);
  }

  Future<String?> getTheme() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(themeKey);
  }

  Future<void> setFirstTime() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(isFirstTimeKey, false);
  }

  Future<bool?> isFirstTime() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isFirstTimeKey);
  }

  Future<void> setCustomData(String key, String? value) async {
    final preferences = await SharedPreferences.getInstance();
    if (value != null) {
      preferences.setString(key, value);
    } else {
      removeValue(key);
    }
  }

  Future<String?> getCustomData(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  Future<void> removeValue(String key) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }
}
