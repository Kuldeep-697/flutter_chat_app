import 'package:social_app/screens/edit_profile.dart';
import 'package:social_app/screens/home_page.dart';
import 'package:social_app/screens/login_page.dart';
import 'package:social_app/screens/main_page.dart';
import 'package:social_app/screens/signup_page.dart';

class AppRoutes {
  static final routes = {
    AppRoutes.signup: (context) => const SignupPage(),
    AppRoutes.login: (context) => const LoginPage(),
    AppRoutes.mainPage: (context) => const MainPage(),
    AppRoutes.homePage: (context) => const HomePage(),
    AppRoutes.editProfile: (context) => const EditProfile()
  };
  static const login = '/login';
  static const signup = '/signup';
  static const mainPage = '/mainPage';
  static const homePage = '/homePage';
  static const editProfile = '/editProfile';
}
