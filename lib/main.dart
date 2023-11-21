import 'package:anotacoesapp/core/services/service_locator.dart';
import 'package:anotacoesapp/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginTela(),      
    );
  }
}
