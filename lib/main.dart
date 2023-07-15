import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/login.dart';
import 'package:quiz_app/Screens/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      title: 'Quiz App',
      home: const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
