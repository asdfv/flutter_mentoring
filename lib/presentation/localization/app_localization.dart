import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizations {
  final Logger log = Logger();

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<AppLocalizations> apply(Locale locale) async {
    String jsonString = await rootBundle.loadString('assets/localizations/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    log.i("Locale loaded: $locale");
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return this;
  }

  String getLocalizedString(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale systemLocale) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storedLocale = sharedPreferences.getString("locale");
    final locale = storedLocale == null ? systemLocale : Locale(storedLocale);
    sharedPreferences.setString("locale", locale.languageCode);
    return await AppLocalizations().apply(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
