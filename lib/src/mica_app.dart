import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mica/l10n/app_localizations.dart';
import 'package:mica/src/loading_screen.dart';
import 'package:mica/src/patient_information.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/widgets/responsive_wrapper.dart';

class MicaApp extends StatelessWidget {
  const MicaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MicaProviders.getProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Midlands Cognitive Assessment",
        // Localization support
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LoadingScreen(),
        builder: (context, child) {
          return ResponsiveWrapper(child: child!);
        },
        theme: ThemeData(
            primaryColor: const Color(0xFF64638f),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF64638f),
              primary: const Color(0xFF64638f),
              secondary: const Color(0xFF9795cf),
              surface: const Color(0xFFaba9e9), // Replacing backgroundColor
            ),
            splashColor: const Color(0xFFaba9e9),
            scaffoldBackgroundColor: const Color(0xFFcbc9ff),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9795cf),
              ),
            ),
            // Use DialogThemeData instead of dialogBackgroundColor
            dialogTheme: const DialogThemeData(
              backgroundColor: Color(0xFFcbc9ff),
            ),
            cardColor: Colors.white),
        routes: <String, WidgetBuilder>{
          '/patient_information': (BuildContext context) =>
              PatientInformation(),
          // ShowImage requires parameters and is used with MaterialPageRoute directly
        },
      ),
    );
  }
}
