// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'theme_prefrences.dart';

class ThemeModel with ChangeNotifier {
  bool _isDark = false;
  late ThemePrefrences _prefrences;

  bool get isDark => _isDark;
  ThemeModel() {
    _isDark = false;
    _prefrences = ThemePrefrences();
    getPrefrences();
  }

  set isDark(bool value) {
    _isDark = value;
    _prefrences.setTheme(value);
    notifyListeners();
  }

  getPrefrences() async {
    _isDark = await _prefrences.getTheme();
    notifyListeners();
  }
}
