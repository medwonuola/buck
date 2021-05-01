import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  changeTheme(ThemeData theme) async {
    _themeData = theme;
    notifyListeners();
  }
}
