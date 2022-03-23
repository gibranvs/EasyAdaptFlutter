import 'package:easy_adapt/ui/pages/home.dart';
import 'package:easy_adapt/ui/pages/initial_page.dart';
import 'package:easy_adapt/ui/pages/layout/layout.dart';
import 'package:easy_adapt/ui/pages/login.dart';
import 'package:easy_adapt/ui/pages/pacientes/add_patients.dart';
import 'package:easy_adapt/ui/pages/pacientes/patients_calc.dart';
import 'package:easy_adapt/ui/pages/player/player.dart';
import 'package:easy_adapt/ui/pages/register_page.dart';
import 'package:easy_adapt/ui/pages/terms.dart';

getRoutes(t) {
  return {
    '/initial': (context) => InitialPage(
          t: t,
        ),
    '/register': (context) => RegisterPage(
          t: t,
        ),
    '/terms': (context) => TermsPage(
          t: t,
        ),
    '/login': (context) => LoginPage(
          t: t,
        ),
    '/home': (context) => HomePage(
          t: t,
        ),
    '/layout': (context) => Layout(
          t: t,
        ),
    '/calc/patients': (context) => PatientsCalc(
          t: t,
        ),
    '/patients/add-patient': (context) => AddPatientsPage(
          t: t,
        ),
    '/tutorials/video': (context) => VideoApp()
  };
}
