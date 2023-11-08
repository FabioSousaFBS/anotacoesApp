import 'package:anotacoesapp/presentation/pages/anotacoes_screen.dart';
import 'package:anotacoesapp/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
      debugShowCheckedModeBanner: false,  
      home: LoginTela(),
      initialRoute: LoginTela.id,
      routes: {
        LoginTela.id: (context) => LoginTela(), 
        AnotacoesTela.id: (context) => AnotacoesTela(),
      },
    );
  }
}

