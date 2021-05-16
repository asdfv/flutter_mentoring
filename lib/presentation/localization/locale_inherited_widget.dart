
import 'package:flutter/widgets.dart';

class LocaleInheritedWidget extends InheritedWidget {
  LocaleInheritedWidget({Key key, this.onLanguageChanged, child}) : super(key: key, child: child);

  final Function(String) onLanguageChanged;

  static LocaleInheritedWidget of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(LocaleInheritedWidget oldWidget) {
    return oldWidget.onLanguageChanged != onLanguageChanged;
  }
}
