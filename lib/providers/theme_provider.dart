import 'package:flutter/foundation.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  void toggleMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
