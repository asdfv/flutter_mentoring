import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore {
  void saveLanguage(String language);

  String? getCurrentLanguage();
}

class SharedPreferencesStore extends LocalStore {
  SharedPreferencesStore(this.sharedPreferences);

  final SharedPreferences sharedPreferences;
  final log = Logger();

  @override
  String? getCurrentLanguage() => sharedPreferences.getString(_localeKey);

  @override
  void saveLanguage(String language) {
    sharedPreferences.setString(_localeKey, language).then((success) {
      if (success) {
        log.i("Language saved: $language");
      } else {
        log.i("Language is not saved: $language");
      }
    });
  }
}

const String _localeKey = "locale";
