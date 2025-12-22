import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../features/auth/domain/models/login_model.dart';
import '../../shared/constant/local_storage_keys.dart';

class LocalStorageService {
  SharedPreferences? _preferences;
  final FlutterSecureStorage _flutterSecuredStorage =
      const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  LocalStorageService() {
    _init();
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// get is onboarding
  bool getIsDoneOnboarding() {
    final isDoneOnboarding = _preferences?.getBool(
      LocalStorageKey.isDoneOnboarding,
    );
    if (isDoneOnboarding == null) {
      return false;
    }

    return isDoneOnboarding;
  }

  /// set is onboarding
  Future<void> setIsDoneOnboarding(bool value) async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.setBool(LocalStorageKey.isDoneOnboarding, value);
  }

  /// delete is onboarding
  Future<void> deleteIsDoneOnboarding() async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.remove(LocalStorageKey.isDoneOnboarding);
  }

  /// set refresh token
  Future<void> setRefreshToken(String token) async {
    await _flutterSecuredStorage.write(
      key: LocalStorageKey.refreshToken,
      value: token,
    );
  }

  /// get refresh token
  Future<String?> getRefreshToken() async {
    return await _flutterSecuredStorage.read(key: LocalStorageKey.refreshToken);
  }

  /// delete refresh token
  Future<void> deleteRefreshToken() async {
    await _flutterSecuredStorage.delete(key: LocalStorageKey.refreshToken);
  }

  /// set token
  Future<void> setAccessToken(String token) async {
    await _flutterSecuredStorage.write(
      key: LocalStorageKey.accessToken,
      value: token,
    );
  }

  bool getIsGuest() {
    final isGuest = _preferences?.getString(LocalStorageKey.accessToken);
    if (isGuest == null) {
      return true;
    }
    return false;
  }

  /// get token
  Future<String?> getAccessToken() {
    return _flutterSecuredStorage.read(key: LocalStorageKey.accessToken);
  }

  /// delete token
  Future<void> deleteAccessToken() async {
    await _flutterSecuredStorage.delete(key: LocalStorageKey.accessToken);
  }

  /// set is dark mode
  Future<void> setIsDarkMode(bool value) async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.setBool(LocalStorageKey.isDarkMode, value);
  }

  /// get is dark mode
  bool getIsDarkMode() {
    final isDarkMode = _preferences?.getBool(LocalStorageKey.isDarkMode);
    if (isDarkMode == null) {
      return false;
    }
    return isDarkMode;
  }

  /// clear all
  Future<void> clear() async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.clear();
    await _flutterSecuredStorage.deleteAll();
  }

  // set app theme mode
  Future<void> setAppThemeMode(bool isDarkMode) async {
    if (_preferences != null) {
      await _preferences!.setBool(LocalStorageKey.themeMode, isDarkMode);
    }
  }

  bool getAppThemeMode() {
    return _preferences?.getBool(LocalStorageKey.themeMode) ?? false;
  }

  void deleteAppThemeMode() {
    _preferences?.remove(LocalStorageKey.themeMode);
  }

  // /// Clear all authentication data
  Future<void> clearAuthData() async {
    if (_preferences == null) {
      return;
    }
    await deleteAccessToken();
    await deleteRefreshToken();
    // Add any other auth-related data that needs to be cleared
  }

  /// Set user data - accepts UserData object and handles JSON encoding
  Future<void> setUserData(User userData) async {
    if (_preferences == null) {
      return;
    }
    try {
      final userDataJson = jsonEncode(userData.toJson());
      await _preferences?.setString(LocalStorageKey.userData, userDataJson);
    } catch (e) {
      debugPrint("Error saving user data ${e.toString()}");
    }
  }

  /// Get user data - handles JSON decoding and returns UserData object
  User? getUserData() {
    if (_preferences == null) {
      return null;
    }
    final userDataJson = _preferences?.getString(LocalStorageKey.userData);
    if (userDataJson == null) {
      return null;
    }
    try {
      return User.fromJson(jsonDecode(userDataJson));
    } catch (e) {
      return null;
    }
  }

  /// Delete user data
  Future<void> deleteUserData() async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.remove(LocalStorageKey.userData);
  }

  /// Set watchlist IDs - accepts Set<String> and stores as JSON list
  Future<void> setWatchlistIds(Set<String> athleteIds) async {
    if (_preferences == null) {
      return;
    }
    try {
      final idsJson = jsonEncode(athleteIds.toList());
      await _preferences?.setString(LocalStorageKey.watchlistIds, idsJson);
    } catch (e) {
      debugPrint("Error saving watchlist IDs: ${e.toString()}");
    }
  }

  /// Get watchlist IDs - returns Set<String> from JSON list
  Future<Set<String>> getWatchlistIds() async {
    if (_preferences == null) {
      return {};
    }
    final idsJson = _preferences?.getString(LocalStorageKey.watchlistIds);
    if (idsJson == null) {
      return {};
    }
    try {
      final List<dynamic> idsList = jsonDecode(idsJson);
      final ids = idsList.map((id) => id.toString()).toSet();
      return ids;
    } catch (e) {
      return {};
    }
  }

  /// Delete watchlist IDs
  Future<void> deleteWatchlistIds() async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.remove(LocalStorageKey.watchlistIds);
  }
}
