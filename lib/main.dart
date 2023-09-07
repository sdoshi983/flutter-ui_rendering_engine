import 'package:flutter/material.dart';
import 'package:ui_rendering_engine/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Rendering Engine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitialClass(),
    );
  }
}

class InitialClass extends StatelessWidget {
  const InitialClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

