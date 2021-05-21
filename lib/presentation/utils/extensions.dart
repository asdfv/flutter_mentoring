import 'package:flutter/widgets.dart';
import 'package:flutter_mentoring/presentation/localization/app_localization.dart';

extension ContextExtension on BuildContext {
  String getLocalizedString(String key) => AppLocalizations.of(this).getLocalizedString(key)!;
}
