import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,
        title: const Text(
          'Sportified Lesson Timer',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        ),
        body: Center(
          child: const Text("Hello world"),
        )
      ),
    );
  }
}