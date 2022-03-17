import 'package:easy_adapt/ui/pages/login_page.dart';
import 'package:easy_adapt/ui/pages/register_page.dart';
import 'package:easy_adapt/ui/pages/terms.dart';

getRoutes() {
  return {
    '/initial': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/terms': (context) => TermsPage()
  };
}
