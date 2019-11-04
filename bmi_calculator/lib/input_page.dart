import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Import custom widgets
import 'custom_card.dart';
import 'icon_content.dart';

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
              Expanded(child: CustomCard(
                colour: activeCardColour,
                child: IconContent(
                  cardIconData: FontAwesomeIcons.mars,
                  iconSize: 80.0,
                  cardText: 'MALE',
                ),
                ),
              ),
              Expanded(child: CustomCard(
                colour: activeCardColour,
                child: IconContent(
                  cardIconData: FontAwesomeIcons.female,
                  iconSize: 80.0,
                  cardText: 'FEMALE',
                ),
                ),
              ),
            ],
          )),
          Expanded(child: CustomCard(
                colour: activeCardColour,
                ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: CustomCard(
                colour: activeCardColour,
                ),
              ),
              Expanded(child: CustomCard(
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


