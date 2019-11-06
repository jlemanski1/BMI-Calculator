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
  Gender selectedGender;
  int height = 180;

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
                  colour: selectedGender == Gender.male ? kActiveCardColour : kInActiveCardColour,
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
                colour: selectedGender == Gender.female ? kActiveCardColour : kInActiveCardColour,
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
            colour: kActiveCardColour,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  activeColor: Color(0xFFEB1555),
                  min: 120.0,
                  max: 220.0,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ],
              ),
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: CustomCard(
                colour: kActiveCardColour,
                ),
              ),
              Expanded(child: CustomCard(
                colour: kActiveCardColour,
                ),
              ),
            ],),
          ),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      )
    );
  }
}


