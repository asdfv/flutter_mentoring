import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleInheritedWidget extends InheritedWidget {
  final StreamController<Locale> localeStreamController = StreamController<Locale>();

  LocaleInheritedWidget({child}) : super(child: child);

  static LocaleInheritedWidget of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

  void changeLocale(Locale locale) {
    SharedPreferences.getInstance()
        .then((sharedPreferences) {
          localeStreamController.add(locale);
          sharedPreferences.setString("locale", locale.languageCode);
    });
  }

  Stream<Locale> getLocaleStream() => localeStreamController.stream;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
