import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static final SharedPrefHelper instance = SharedPrefHelper._internal();

  SharedPrefHelper._internal();

  // Instance of SharedPreferences
  static SharedPreferences? _preferences;

  // Initialize the SharedPreferences instance
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Set String value
  Future<bool> setString(String key, String value) async {
    return await _preferences?.setString(key, value) ?? false;
  }

  /// Get String value
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  /// Set Integer value
  Future<bool> setInt(String key, int value) async {
    return await _preferences?.setInt(key, value) ?? false;
  }

  /// Get Integer value
  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  /// Set Boolean value
  Future<bool> setBool(String key, bool value) async {
    return await _preferences?.setBool(key, value) ?? false;
  }

  /// Get Boolean value
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  /// Set Double value
  Future<bool> setDouble(String key, double value) async {
    return await _preferences?.setDouble(key, value) ?? false;
  }

  /// Get Double value
  double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  /// Set List<String> value
  Future<bool> setStringList(String key, List<String> value) async {
    return await _preferences?.setStringList(key, value) ?? false;
  }

  /// Get List<String> value
  List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  /// Remove a key
  Future<bool> remove(String key) async {
    return await _preferences?.remove(key) ?? false;
  }

  /// Clear all keys
  Future<bool> clearAll() async {
    return await _preferences?.clear() ?? false;
  }

  /// Check if a key exists
  bool containsKey(String key) {
    return _preferences?.containsKey(key) ?? false;
  }
}
