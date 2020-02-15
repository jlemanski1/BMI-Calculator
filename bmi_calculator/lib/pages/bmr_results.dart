import 'package:flutter/material.dart';

import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class BMRResultsPage extends StatelessWidget {

  final int bmrResult;
  final String interpretation;

  BMRResultsPage({@required this.bmrResult, @required this.interpretation});

  // TODO: Add Text bits to show cal count to maintai, gain, or lose weight

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ezBMR',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen
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
                    'Lose (1 lb/wk): ${(bmrResult-350)?.toString()}\nLose (1-2 lb/wk): ${(bmrResult-500)?.toString()}',
                    style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    'Consume ${bmrResult?.toString()} calories to maintain your current weight',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Gain (1 lb/wk): ${(bmrResult+350)?.toString()}\nGain (1-2 lb/wk): ${(bmrResult+500)?.toString()}',
                    style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    )
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
            colour: Colors.green[600],
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}