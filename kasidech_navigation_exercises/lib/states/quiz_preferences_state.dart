import 'package:flutter/material.dart';

class QuizPreferencesState extends ChangeNotifier {
  String _userName       = 'Kasidech';
  String _userBio        = 'Quiz Lover';
  bool   _soundEnabled   = true;
  bool   _vibrationEnabled = true;
  ThemeMode _themeMode   = ThemeMode.system;

  String get userName => _userName;
  String get userBio => _userBio;
  bool get soundEnabled => _soundEnabled;
  bool get vibrationEnabled => _vibrationEnabled;
  ThemeMode get themeMode => _themeMode;
  
  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }
  // ... setters for each field that call notifyListeners()
  void setUserBio(String bio) {
    _userBio = bio;
    notifyListeners();
  }

  void setSoundEnabled(bool sound) {
    _soundEnabled = sound;
    notifyListeners();
  }

  void setVibrationEnabled(bool vibe) {
    _vibrationEnabled = vibe;
    notifyListeners();
  }

  void setThemeMode(ThemeMode theme) {
    _themeMode = theme;
    notifyListeners();
  }

}
