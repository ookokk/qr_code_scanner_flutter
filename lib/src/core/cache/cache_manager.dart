import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static final CacheManager _singleton = CacheManager._internal();

  factory CacheManager() {
    return _singleton;
  }

  CacheManager._internal();

  static const String themeKey = 'theme';
  static const String firstTimeKey = 'firstTime';

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
    preferences.setBool(firstTimeKey, false);
  }

  Future<bool?> isFirstTime() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(firstTimeKey);
  }
}
