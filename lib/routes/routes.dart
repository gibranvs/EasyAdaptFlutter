import 'package:easy_adapt/ui/pages/login_page.dart';
import 'package:easy_adapt/ui/pages/register_page.dart';

getRoutes() {
  return {
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage()
  };
}
