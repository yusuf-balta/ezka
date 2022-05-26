import 'package:ezka/routes.dart';
import 'package:ezka/screens/login_screen/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('tr', 'TR'),
      debugShowCheckedModeBanner: false,
      title: 'Ezka',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF0047ba),
        primaryColorDark: const Color(0xFF090f4e),
        primaryColorLight: const Color(0xFF5a7184),
        backgroundColor: Colors.white,
        highlightColor: Colors.transparent,
      ),
      getPages: routes,
      initialRoute: LoginView.routeName,
    );
  }
}
