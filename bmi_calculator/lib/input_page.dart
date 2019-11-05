import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Import custom widgets
import 'custom_card.dart';
import 'icon_content.dart';

// Active (MainPage) Card
const activeCardColour = Color(0xFF1D1E33);
const inActiveCardColour = Color(0xFF111328);

// Bottom Container
const bottomContainerHeight = 80.0;
const bottomContainerColour = Color(0xFFEB1555); 



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  // 0: female, 1: male
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inActiveCardColour) {
        maleCardColour = activeCardColour;
      } else {
        maleCardColour = inActiveCardColour;
      }
    } else {
      if (femaleCardColour == inActiveCardColour) {
        femaleCardColour = activeCardColour;
      } else {
        femaleCardColour = inActiveCardColour;
      }
    }
  }

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
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColour(1);
                    });
                  },
                  child: CustomCard(
                    colour: maleCardColour,
                    child: IconContent(
                      cardIconData: FontAwesomeIcons.mars,
                      iconSize: 80.0,
                      cardText: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColour(0);
                  });
                },
                child: CustomCard(
                  colour: femaleCardColour,
                  child: IconContent(
                    cardIconData: FontAwesomeIcons.female,
                    iconSize: 80.0,
                    cardText: 'FEMALE',
                  ),
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


