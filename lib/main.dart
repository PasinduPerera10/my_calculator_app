import 'package:flutter/material.dart';
import 'package:my_calculator_app/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context) {
   return const MaterialApp(
    home: HomePage()
   );
  }
}