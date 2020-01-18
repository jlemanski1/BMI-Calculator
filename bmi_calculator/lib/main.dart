import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());


class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ezBMI',
      debugShowCheckedModeBanner: false,  // Hide banner for taking screens with emulator
      theme: ThemeData.dark(),
      /*
      .copyWith(
        primaryColor: Color(0xFF5F1478),//Color(0xFF45BCED),  //OG colour 0xFF0A0E21
        scaffoldBackgroundColor: Color(0xFF3D0D4D),//Color(0xFF0A0E21),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
      ),
      */
      home: InputPage(),
    );
  }
}


