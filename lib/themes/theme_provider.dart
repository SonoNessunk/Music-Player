import 'package:flutter/material.dart';
import 'package:music_player/themes/dark_mode.dart';
import 'package:music_player/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
	ThemeData _themeData = darkMode;
	bool _isLoading = true;

	bool get isLoading => _isLoading;
	ThemeData get themeData => _themeData;

	bool get isDarkMode => _themeData == darkMode;

	ThemeProvider() {
		_loadTheme();
	}

	Future<void> _loadTheme() async {
		final prefs = await SharedPreferences.getInstance();
		final isDark = prefs.getBool('isDarkMode') ?? false;
		_themeData = isDark ? darkMode : lightMode;
		_isLoading = false;
		notifyListeners();
	}

	Future<void> _saveTheme(bool isDark) async {
		final prefs = await SharedPreferences.getInstance();
		await prefs.setBool('isDarkMode', isDark);
	}

	void toggleTheme() {
		_themeData = _themeData == lightMode ? darkMode : lightMode;
		_saveTheme(isDarkMode);
		notifyListeners();
	}
}
