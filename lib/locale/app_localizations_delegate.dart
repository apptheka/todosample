import 'package:flutter/material.dart';
import 'app_locale_init.dart';

class ApplicationLocalizationsDelegate
    extends LocalizationsDelegate<ApplicationLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const ApplicationLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'nl'].contains(locale.languageCode);
  }

  @override
  Future<ApplicationLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    ApplicationLocalizations localizations =
        ApplicationLocalizations(appLocale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(ApplicationLocalizationsDelegate old) => false;
}
