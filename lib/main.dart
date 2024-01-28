import 'package:flutter/material.dart';
import 'package:flutter_printer_thermal/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'thermal pritner',
      home: HomePage(),
    );
  }
}
