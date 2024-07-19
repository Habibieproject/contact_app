import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  // STORING KEYS
  static const String _userId = 'userId';
  static const String _isLoggedIn = 'isLoggedIn';
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> get _instance async =>
      _preferences ??= await SharedPreferences.getInstance();

//storing

  static Future<void> storingUserID(int userID) async {
    final preferences = await _instance;
    preferences.setInt(_userId, userID);
  }

  static Future<void> storingIsLoggin(bool isLoggedIn) async {
    final preferences = await _instance;
    preferences.setBool(_isLoggedIn, isLoggedIn);
  }

//retrieve
  static Future<String?> retrieveUserID() async {
    final preferences = await _instance;
    String? result = preferences.getString(_userId);
    return result;
  }

  static Future<bool?> retrieveIsLoggedIn() async {
    final preferences = await _instance;
    bool? result = preferences.getBool(_isLoggedIn);
    return result;
  }

//remove

  static Future<bool> removeUserID() async {
    final preferences = await _instance;
    preferences.remove(_userId);
    return true;
  }

  static Future<bool> removeIsLoggedIn() async {
    final preferences = await _instance;
    preferences.remove(_isLoggedIn);
    return true;
  }
}
