import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                cardChild: GenderCard(
                  cardIconData: FontAwesomeIcons.mars,
                  iconSize: 80.0,
                  cardText: 'MALE',
                ),
                ),
              ),
              Expanded(child: MainPageCard(
                colour: activeCardColour,
                cardChild: GenderCard(
                  cardIconData: FontAwesomeIcons.female,
                  iconSize: 80.0,
                  cardText: 'FEMALE',
                ),
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

class GenderCard extends StatelessWidget {
  final IconData cardIconData;
  final double iconSize;
  final String cardText;

  GenderCard({@required this.cardIconData, this.iconSize, this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIconData,
          size: iconSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(cardText, style: TextStyle(
          fontSize: 18.0, color: Color(0xFF8D8E98)
        ))
      ],
    );
  }
}


class MainPageCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  MainPageCard({@required this.colour, this.cardChild});  //Require Colour param

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        ),
      );
  }
}
