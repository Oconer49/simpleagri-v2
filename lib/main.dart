import 'package:flutter/material.dart';
import 'package:flutter_simpleagri_prueba/lib/view/login.dart';
import 'package:flutter_simpleagri_prueba/lib/view/menu.dart';
import 'package:flutter_simpleagri_prueba/lib/view/terrenos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        '/menu': (context) => Menu(),
        '/terrenos': (context) => TerrenosPage(),
      },
    );
  }
}
