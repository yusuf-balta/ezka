import 'package:ezka/screens/home_screen/home_view.dart';
import 'package:ezka/screens/login_screen/login_view.dart';
import 'package:ezka/screens/register_screen/register_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes = [
  // for home screen
  GetPage(name: HomeView.routeName, page: () => HomeView()),
  // for login screen
  GetPage(name: LoginView.routeName, page: () => LoginView()),
  // for register screen
  GetPage(name: RegisterView.routeName, page: () => RegisterView()),
];
