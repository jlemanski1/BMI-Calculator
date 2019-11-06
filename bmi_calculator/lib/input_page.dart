import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

//Import custom widgets
import 'custom_card.dart';
import 'icon_content.dart';


enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  Gender selectedGender;

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
                child: CustomCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? activeCardColour : inActiveCardColour,
                  child: IconContent(
                    cardIconData: FontAwesomeIcons.mars,
                    iconSize: 80.0,
                    cardText: 'MALE',
                  ),
                ),
              ),
              Expanded(child: CustomCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? activeCardColour : inActiveCardColour,
                child: IconContent(
                  cardIconData: FontAwesomeIcons.venus,
                  iconSize: 80.0,
                  cardText: 'FEMALE',
                  ),
                ),
              ),
            ],),
          ),
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


