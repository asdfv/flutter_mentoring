
import 'package:flutter/widgets.dart';

class LocaleInheritedWidget extends InheritedWidget {
  final Function(String) onLanguageChanged;

  LocaleInheritedWidget({Key key, this.onLanguageChanged, child}) : super(key: key, child: child);

  static LocaleInheritedWidget of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(LocaleInheritedWidget oldWidget) {
    return oldWidget.onLanguageChanged != onLanguageChanged;
  }
}
