import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mentoring/presentation/localization/locale_inherited_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/extensions.dart';

class SettingsPage extends StatelessWidget {
  static final route = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getLocalizedString("settings_title")),
      ),
      body: Row(
        children: [
          Text(context.getLocalizedString("settings_language_label")),
          LanguagePickerWidget(),
        ],
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localeInheritedWidget = LocaleInheritedWidget.of(context);

    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final currentLocale = snapshot.data.getString("locale");
          final Function enOnPressed = currentLocale == "ru"
              ? () {
                  localeInheritedWidget.onLanguageChanged("en");
                }
              : null;
          final Function ruOnPressed = currentLocale == "en"
              ? () {
                  localeInheritedWidget.onLanguageChanged("ru");
                }
              : null;
          return Row(
            children: [
              ElevatedButton(onPressed: enOnPressed, child: Text("En")),
              ElevatedButton(onPressed: ruOnPressed, child: Text("Ru")),
            ],
          );
        });
  }
}
