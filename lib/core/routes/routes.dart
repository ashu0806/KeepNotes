import 'package:auto_route/annotations.dart';
import 'package:notes_app/auth/presentation/logIn/login_page.dart';
import 'package:notes_app/auth/presentation/signUp/signup_page.dart';
import 'package:notes_app/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      page: LogInPage,
    ),
    AutoRoute(
      page: SignUpPage,
    ),
  ],
)
class $AppRouter {}
