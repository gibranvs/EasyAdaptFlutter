import 'package:easy_adapt/i18n/strings.g.dart';
import 'package:easy_adapt/routes/routes.dart';
import 'package:easy_adapt/splash_screen.dart';
import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:easy_adapt/state/menu_state.dart';
import 'package:easy_adapt/state/patient_state.dart';
import 'package:easy_adapt/state/player_state.dart';
import 'package:easy_adapt/state/result_state.dart';
import 'package:easy_adapt/ui/widgets/calculadora_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefsMain;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefsMain = await SharedPreferences.getInstance();
  switch (prefsMain.getString('idioma')) {
    case '1':
      var result = LocaleSettings.setLocaleRaw('en');

      break;
    case '2':
      var result = LocaleSettings.setLocaleRaw('es');

      break;
    case '3':
      var result = LocaleSettings.setLocaleRaw('pt');

      break;
    default:
      var result = LocaleSettings.setLocaleRaw('en');
  }
  runApp(MultiProvider(
    providers: [
      ListenableProvider<PlayerState>(
        create: (_) => PlayerState(),
      ),
      ListenableProvider<CalculatorState>(
        create: (_) => CalculatorState(),
      ),
      ListenableProvider<MenuState>(
        create: (_) => MenuState(),
      ),
      ListenableProvider<ResultState>(
        create: (_) => ResultState(),
      ),
      ListenableProvider<PatientState>(
        create: (_) => PatientState(),
      ),
      ListenableProvider<CalculatorTotalState>(
        create: (_) => CalculatorTotalState(),
      )
    ],
    child: TranslationProvider(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translation = Translations.of(context);

    return MaterialApp(
      locale: TranslationProvider.of(context).flutterLocale,
      debugShowCheckedModeBanner: false,
      supportedLocales: LocaleSettings.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      title: 'EasyAdapt',
      theme: ThemeData(primarySwatch: Colors.blue),
      // initialRoute: getInitialRoute(prefs),
      // home: CalculadoraTotal(),
      home: SplashScreen(
        prefs: prefsMain,
      ),
      routes: getRoutes(translation),
    );
  }
}
