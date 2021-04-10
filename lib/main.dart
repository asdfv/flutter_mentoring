import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vasili_mentoring_tasks/data/todo_store.dart';
import 'package:vasili_mentoring_tasks/presentation/settings_page.dart';

import 'presentation/localization/app_localization.dart';
import 'presentation/todo_page.dart';

void main() {
  runApp(MyApp());
}

/// App with list of items and possibility to show tapped item in header.
/// Changing language is available on the settings page.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoStore store = TodoStore();
    return MaterialApp(
      title: 'Module 9. Localizations and assets.',
      initialRoute: TodoPage.route,
      routes: {
        TodoPage.route: (_) => TodoPage(store: store),
        SettingsPage.route: (_) => SettingsPage()
      },
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: TodoPage(
        store: store,
      ),
    );
  }
}
