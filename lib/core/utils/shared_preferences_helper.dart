import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _userIdKey = "_userId"; // Khóa lưu _id người dùng
  static const String _api = "https://e18d-42-115-115-73.ngrok-free.app/"; // Khóa lưu API người dùng


  // Lưu _id
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  // Lấy _id
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  // Xóa _id
  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
  }
  // Lấy API
  static String getAPI() {
    return _api;
  }
}
