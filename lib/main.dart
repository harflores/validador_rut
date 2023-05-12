import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:validador_rut/screens/about_me_screen.dart';
import 'package:validador_rut/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'nosotros': (_) => const AboutScreen(),
      },
    );
  }
}
