import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mentoring/presentation/store/local_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/todo_store.dart';
import 'presentation/localization/app_localization.dart';
import 'presentation/settings_page.dart';
import 'presentation/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final todoStore = TodoStore();
  runApp(LocalizedApp(todoStore, SharedPreferencesStore(sharedPreferences)));
}

/// App with list of items and possibility to show tapped item in header.
/// Changing language is available on the settings page.
/// If there are no previously saved by user language then system locale is loaded.
class LocalizedApp extends StatefulWidget {
  LocalizedApp(this.todoStore, this.localStore);

  final LocalStore localStore;
  final TodoStore todoStore;

  @override
  _LocalizedAppState createState() => _LocalizedAppState();

  static _LocalizedAppState? of(BuildContext context) => context.findAncestorStateOfType<_LocalizedAppState>();
}

class _LocalizedAppState extends State<LocalizedApp> {
  String? _language;

  String? getLanguage() => _language;

  void setLanguage(String language) {
    setState(() {
      _language = language;
    });
    widget.localStore.saveLanguage(language);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Module 9. Localizations and assets.',
        initialRoute: TodoPage.route,
        locale: _language != null ? Locale(_language!) : null,
        routes: {
          TodoPage.route: (_) => TodoPage(store: widget.todoStore),
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
        localeResolutionCallback: (currentLocale, supportedLocales) {
          final storedLanguage = widget.localStore.getCurrentLanguage();
          final Locale localeToLoad;
          if (storedLanguage == null) {
            localeToLoad =
                supportedLocales.contains(currentLocale) && currentLocale != null ? currentLocale : supportedLocales.first;
            widget.localStore.saveLanguage(localeToLoad.languageCode);
          } else {
            localeToLoad = Locale(storedLanguage);
          }
          _language = localeToLoad.languageCode;
          return localeToLoad;
        });
  }
}
