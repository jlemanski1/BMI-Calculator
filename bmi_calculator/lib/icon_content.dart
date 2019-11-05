import 'package:flutter/material.dart';


/*
  Custom Widget meant to be a child of custom_card.dart and provides a large, styled
  icon, with a text label.
*/
class IconContent extends StatelessWidget {
  final IconData cardIconData;
  final double iconSize;
  final String cardText;

  IconContent({@required this.cardIconData, this.iconSize, this.cardText});

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