import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'results_page.dart';
import 'calculator.dart';

//Import custom widgets
import 'custom_card.dart';
import 'icon_content.dart';
import 'round_icon_button.dart';
import 'bottom_button.dart';



enum Measurement {
  imperial,
  metric,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Measurement selectedMeasure;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ezBMI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: CustomCard(
                  onPress: (){
                    setState(() {
                      selectedMeasure = Measurement.metric;
                    });
                  },
                  colour: selectedMeasure == Measurement.metric ? kActiveCardColour : kInActiveCardColour,
                  child: IconContent(
                    cardIconData: FontAwesomeIcons.pencilRuler,
                    iconSize: 80.0,
                    cardText: 'METRIC',
                  ),
                ),
              ),
              Expanded(child: CustomCard(
                onPress: (){
                  setState(() {
                    selectedMeasure = Measurement.imperial;
                  });
                },
                colour: selectedMeasure == Measurement.imperial ? kActiveCardColour : kInActiveCardColour,
                child: IconContent(
                  cardIconData: FontAwesomeIcons.rulerCombined,
                  iconSize: 80.0,
                  cardText: 'IMPERIAL',
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
                      selectedMeasure == Measurement.metric ? 'cm' : 'ft/in',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    overlayColor: Color(0x29EB1555),
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
              ),
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: CustomCard(
                colour: kActiveCardColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        SizedBox(width: 18.0,),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          selectedMeasure == Measurement.metric ? 'kg' : 'lbs',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              if (weight > 40)
                                weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              if (weight < 300)
                                weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                ),
              ),
              Expanded(child: CustomCard(
                colour: kActiveCardColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              if (age > 0)
                                age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              if (age < 90)
                                age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                ),
              ),
            ],),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              Calculator calc = Calculator(height: height, weight: weight);
              
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                  resultColour: calc.getResultColour(),
                )
              ));
            },
          ),
        ],
      )
    );
  }
}


