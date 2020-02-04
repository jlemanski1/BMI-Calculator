import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/bmr_input.dart';
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
      home: PageNavigation()
    );
  }
}


class PageNavigation extends StatefulWidget {
  PageNavigation({Key key}) : super(key: key);

  @override
  _PageNavigationState createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    InputPage(),    
    BMRInputPage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            title: Text('BMI'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            title: Text('BMR'),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[600],
        onTap: _onItemTap,
      ),
    );
  }
}

