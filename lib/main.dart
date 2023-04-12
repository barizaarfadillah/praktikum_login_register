import 'package:flutter/material.dart';
import './home.dart';
import './register.dart';
import './login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/register": (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      initialRoute: "/home",
    );
  }
}
