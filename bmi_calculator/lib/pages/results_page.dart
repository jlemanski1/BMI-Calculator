import 'package:flutter/material.dart';

import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Color resultColour;

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation, @required this.resultColour});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ezBMI',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
                ),
            )
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              colour: Theme.of(context).primaryColor.withOpacity(1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      color: resultColour,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            colour: Colors.orange.withOpacity(0.9),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}