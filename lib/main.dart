import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mentoring/presentation/localization/locale_inherited_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/todo_store.dart';
import 'presentation/localization/app_localization.dart';
import 'presentation/settings_page.dart';
import 'presentation/todo_page.dart';

void main() {
  runApp(LocalizedApp());
}

/// App with list of items and possibility to show tapped item in header.
/// Changing language is available on the settings page.
/// If there are no previously saved by user language then system locale is loaded.
class LocalizedApp extends StatefulWidget {
  @override
  _LocalizedAppState createState() => _LocalizedAppState();
}

class _LocalizedAppState extends State<LocalizedApp> {
  String? language;
  final store = TodoStore();

  void _change(String language) {
    SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setString("locale", language);
    });
    setState(() {
      this.language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LocaleInheritedWidget(
      onLanguageChanged: (language) {
        _change(language);
      },
      child: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return MaterialAppWidget(
            locale: Locale(language ?? snapshot.data?.getString("locale") ?? "en"),
            store: store,
          );
        },
      ),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({required this.locale, required this.store});

  final Locale locale;
  final TodoStore store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Module 9. Localizations and assets.',
        initialRoute: TodoPage.route,
        locale: locale,
        routes: {
          TodoPage.route: (_) => TodoPage(store: store),
          SettingsPage.route: (_) => SettingsPage(),
        },
        supportedLocales: [
          Locale('en'),
          Locale('ru'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        });
  }
}
