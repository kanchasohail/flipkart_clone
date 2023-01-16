import 'package:flipkart_clone/models/language_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier{

  final List<LanguageModel> _languageList = [
    LanguageModel('English', 'This is english language'),
    LanguageModel('हिन्दी', 'यह हिन्दी भाषा है'),
    LanguageModel('मराठी', 'ही मराठी भाषा आहे'),
    LanguageModel('বাংলা', 'এটা বাংলা ভাষা'),
    LanguageModel('తెలుగు', 'ఇది తెలుగు భాష'),
    LanguageModel('اردو', 'یہ اردو زبان ہے۔'),
    LanguageModel('ਪੰਜਾਬੀ', 'ਇਹ ਪੰਜਾਬੀ ਭਾਸ਼ਾ ਹੈ'),
    LanguageModel('ଓରିଆ', 'ଏହା ହେଉଛି ଓରିଆ ଭାଷା'),
    LanguageModel('ಕನ್ನಡ', 'ಇದು ಕನ್ನಡ ಭಾಷೆ'),
    LanguageModel('గుజరాతీ', 'ఇది గుజరాతీ భాష'),
    LanguageModel('తెలుగు', 'ఇది తెలుగు భాష'),
  ];

  List<LanguageModel> get languageList {
    return [..._languageList];
  }

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.get('Language').toString();
}


}