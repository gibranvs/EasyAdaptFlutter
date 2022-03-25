import 'package:easy_adapt/i18n/strings.g.dart';
import 'package:easy_adapt/routes/routes.dart';
import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/state/menu_state.dart';
import 'package:easy_adapt/state/player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      )
    ],
    child: TranslationProvider(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final translation = Translations.of(context);

    return MaterialApp(
      locale: TranslationProvider.of(context).flutterLocale,
      debugShowCheckedModeBanner: false,
      supportedLocales: LocaleSettings.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      title: 'EasyAdapt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/initial',
      routes: getRoutes(translation),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: () {
              LocaleSettings.setLocaleRaw('es');
            }),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
