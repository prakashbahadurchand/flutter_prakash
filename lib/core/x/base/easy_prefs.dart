
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class EasyPrefs {
  static late SharedPreferences _prefs;

  static get prefs => _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferencesManager not initialized. Call SharedPreferencesManager.init() before accessing it.');
    }
    return _prefs;
  }

  static T? getOrSet<T>(String key, T? value, T defaultValue) {
    if (value != null) {
      _setValue(key, value);
      return value;
    }
    return _getValue(key, defaultValue: defaultValue);
  }

  static T? getOrSetEnum<T>(String key, List<T> values, T defaultValue) {
    final existingValue = getEnum<T>(key, values);
    if (existingValue != null) {
      return existingValue;
    } else {
      setEnum(key, defaultValue, values);
      return defaultValue;
    }
  }

  static T? getOrSetModel<T>(
      String key, T? value, T Function(dynamic) fromJson) {
    if (value != null) {
      setJson(key, value);
      return value;
    }
    return getJson(key: key, fromJson: fromJson);
  }

  static T? _getValue<T>(String key, {T? defaultValue}) {
    final value = _prefs.get(key);
    return value != null ? value as T : defaultValue;
  }

  static Future<void> _setValue<T>(String key, T value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type: ${T.toString()}');
    }
  }

  static T? getEnum<T>(String key, List<T> values) {
    final index = _prefs.getInt(key);
    return index != null ? values[index] : null;
  }

  static Future<void> setEnum<T>(String key, T value, List<T> values) async {
    final index = values.indexOf(value);
    await _prefs.setInt(key, index);
  }

  // Model Class Get And Save

  static T? getJson<T>(
      {required String key, required T Function(dynamic) fromJson}) {
    final jsonString = _prefs.getString(key);
    if (jsonString != null) {
      return fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  static Future<void> setJson<T>(String key, T value) async {
    final jsonString = jsonEncode(value);
    await _prefs.setString(key, jsonString);
  }

  // Clear All Prefs Data

  void clearAllPrefs() {
    _prefs.clear();
  }
}

/*
abstract class EasyPrefs {
  static late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferencesManager not initialized. Call SharedPreferencesManager.init() before accessing it.');
    }
    return _prefs;
  }

  static T? getOrSet<T>(String key, T? value, T defaultValue) {
    if (value != null) {
      _setValue(key, value);
      return value;
    }
    return _getValue(key, defaultValue: defaultValue);
  }

  static T? _getValue<T>(String key, {T? defaultValue}) {
    final value = _prefs.get(key);
    return value != null ? value as T : defaultValue;
  }

  static Future<void> _setValue<T>(String key, T value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type: ${T.toString()}');
    }
  }

  T? getEnum<T>(String key, List<T> values) {
    final index = _prefs.getInt(key);
    return index != null ? values[index] : null;
  }

  Future<void> setEnum<T>(String key, T value, List<T> values) async {
    final index = values.indexOf(value);
    await _prefs.setInt(key, index);
  }

  T? getJson<T>(String key, {T? defaultValue}) {
    final jsonString = _prefs.getString(key);
    if (jsonString != null) {
      final jsonValue = jsonDecode(jsonString);
      if (jsonValue is T) {
        return jsonValue;
      }
    }
    return defaultValue;
  }

  Future<void> setJson<T>(String key, T value) async {
    final jsonString = jsonEncode(value);
    await _prefs.setString(key, jsonString);
  }

  void clearAllPrefs() {
    _prefs.clear();
  }

/////////////////////////////////////| Common Functions |//////////////////////////////////////////
*/
/*
  static appThemeMode(AppThemeMode? value) {
    return getOrSet<AppThemeMode>('appThemeMode', value, AppThemeMode.light);
  }

  static appLocaleMode(AppLocaleMode? value) {
    return getOrSet<AppLocaleMode>('appLocaleMode', value, AppLocaleMode.en);
  }

  static userAuthToken(String? value) {
    return getOrSet<String>('userAuthToken', value, "");
  }

  static userDeviceToken(String? value) {
    return getOrSet<String>('userDeviceToken', value, "");
  }

  static userLoggedIn(bool? value) {
    return getOrSet<bool>('userLoggedIn', value, false);
  }

  static showOnboarding(bool? value) {
    return getOrSet<bool>('showOnboarding', value, true);
  }*//*

}
*/
