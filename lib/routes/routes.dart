import 'package:easy_adapt/ui/pages/initial_page.dart';
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
        )
  };
}
