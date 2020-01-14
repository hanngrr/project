import 'package:flutter/material.dart';
import 'package:project/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Lendit",
      theme: ThemeData(
        primarySwatch: myColour,
      ),
      home: LoginPage()
    );
  }
}

const MaterialColor myColour = const MaterialColor(
  0xFFFFCC5C,
  const <int, Color>{
    50: const Color(0xFFFFCC5C),
    100: const Color(0xFFFFCC5C),
    200: const Color(0xFFFFCC5C),
    300: const Color(0xFFFFCC5C),
    400: const Color(0xFFFFCC5C),
    500: const Color(0xFFFFCC5C),
    600: const Color(0xFFFFCC5C),
    700: const Color(0xFFFFCC5C),
    800: const Color(0xFFFFCC5C),
    900: const Color(0xFFFFCC5C),
  },
);