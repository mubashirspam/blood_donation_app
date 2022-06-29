import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagePro extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  late bool _isLoading = false;
  get isLoading => _isLoading;

  setApplanguage(String languageKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('language', languageKey);
    _locale = Locale(languageKey);
    notifyListeners();
  }

  fetechLanguage() async {
    _isLoading = true;
  
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
    String? language = await prefs.getString('language');
    if (language == null) {
      _locale = null;
    } else {
      _locale = Locale(language);
    }
    _isLoading = false;
    notifyListeners();
  }

  setLanguageSameAsSytemLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('language');
    _locale = null;
    notifyListeners();
  }
}
