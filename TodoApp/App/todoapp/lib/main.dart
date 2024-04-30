import 'package:flutter/material.dart';
import 'package:todoapp/screen/intro_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo app',
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 0, 255, 255)),
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(home: IntroScreen());
  }
}

