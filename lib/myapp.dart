
import 'package:first_app/screens/entidades_screen.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    WidgetsFlutterBinding.ensureInitialized();

    var isLoggedIn = false;

    SharedPreferences.getInstance().then((prefs) {
      isLoggedIn = prefs.get('token') != null;
    });

    return MaterialApp(
      //home: isLoggedIn ? const HomePage() : const LoginScreen(),
      title: 'Sou Contribuinte',
      initialRoute: '/',
      routes: {
        '/': (context) => isLoggedIn ? const HomePage() : const LoginScreen(),
        '/home': (context) => const EntidadesPage(),
      }
    );
  }
}
