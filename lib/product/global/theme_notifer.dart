import 'package:flutter/material.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLigfhtTheme = false;

  void changeTheme() {
    isLigfhtTheme = !isLigfhtTheme;
    notifyListeners();
  }

  ThemeData get currnetTheme =>
      isLigfhtTheme ? ThemeData.light() : ThemeData.dark();
}
