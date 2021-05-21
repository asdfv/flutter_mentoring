import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
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
    final app = LocalizedApp.of(context);
    final currentLanguage = app?.getLanguage();
    final Function()? enOnPressed = currentLanguage == "ru"
        ? () {
            app?.setLanguage("en");
          }
        : null;
    final Function()? ruOnPressed = currentLanguage == "en"
        ? () {
            app?.setLanguage("ru");
          }
        : null;
    return Row(
      children: [
        ElevatedButton(onPressed: enOnPressed, child: Text("En")),
        ElevatedButton(onPressed: ruOnPressed, child: Text("Ru")),
      ],
    );
  }
}
