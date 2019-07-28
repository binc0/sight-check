import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sight_check/AppLocalizations.dart';
import 'package:sight_check/pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sight-Check',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue // Blue works great color-blind people
          ),
      // List all of the app's supported locales here
      supportedLocales: [
        Locale("en", "US"),
        Locale("de", "DE"),
        Locale("es", "ES"),
        Locale("hi", "HI"),
        Locale("ar", "AR"),
        Locale("fr", "FR"),
        Locale("tr", "TR"),
        Locale("ru", "RU"),
        Locale("ja", "JA"),
        Locale("pt", "PT"),
        Locale("it", "IT"),
        Locale("ms", "MS"),
        Locale("zh", "ZH"),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      home: HomePage(),
    );
  }
}
