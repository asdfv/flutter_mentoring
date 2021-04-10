import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatelessWidget {
  static final route = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Row(
        children: [Text("Language: "), Center(child: LanguagePickerWidget())],
      ),
    );
  }
}

class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({Key key}) : super(key: key);

  @override
  _LanguagePickerWidgetState createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 18,
      elevation: 8,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Русский', 'English']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
