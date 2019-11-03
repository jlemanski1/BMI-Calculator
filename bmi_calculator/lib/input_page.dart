import 'package:flutter/material.dart';

// Active (MainPage) Card
const activeCardColour = Color(0xFF1D1E33);

// Bottom Container
const bottomContainerHeight = 80.0;
const bottomContainerColour = Color(0xFFEB1555); 


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: MainPageCard(
                colour: activeCardColour,
                ),
              ),
              Expanded(child: MainPageCard(
                colour: activeCardColour,
                ),
              ),
            ],
          )),
          Expanded(child: MainPageCard(
                colour: activeCardColour,
                ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: MainPageCard(
                colour: activeCardColour,
                ),
              ),
              Expanded(child: MainPageCard(
                colour: activeCardColour,
                ),
              ),
            ],),
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      )
    );
  }
}


class MainPageCard extends StatelessWidget {
  final Color colour;

  MainPageCard({@required this.colour});  //Require Colour param

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        ),
      );
  }
}
