import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results_page.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/calculator.dart';
import 'package:bmi_calculator/components/measure.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:holding_gesture/holding_gesture.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Measurement selectedMeasure = Measurement.metric;
  int age = 18;
  // Metric Units
  int height = 180;
  int weight = 60;
  // Imperial Display Units
  int displayFt = 5;
  int displayIn = 8;
  int weightLbs = 150;
  int heightIn = 84; // actual height in inches



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
                  colour: selectedMeasure == Measurement.metric ?
                    Theme.of(context).primaryColor.withOpacity(1.0) : Theme.of(context).primaryColor.withOpacity(0.6),
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
                colour: selectedMeasure == Measurement.imperial ?
                  Theme.of(context).primaryColor.withOpacity(1.0) : Theme.of(context).primaryColor.withOpacity(0.6),
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
            colour: Theme.of(context).primaryColor.withOpacity(1.0),
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
                      selectedMeasure == Measurement.metric ? height.toString() : '${displayFt.toString()},${displayIn.toString()}',
                      style: kNumberTextStyle,
                    ),
                    Text(
                      selectedMeasure == Measurement.metric ? 'cm' : 'ft,in',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    overlayColor: Color(0x29EB1555),
                    thumbColor: Color(0xFFFA1536),//Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: selectedMeasure == Measurement.metric ? height.toDouble() : heightIn.toDouble(),
                    min: selectedMeasure == Measurement.metric ? 120.0 : 48.0,
                    max: selectedMeasure == Measurement.metric ? 210.0 : 84,
                    onChanged: (double newValue) {
                      if (selectedMeasure == Measurement.metric) {
                        setState(() {
                          height = newValue.round();
                        });
                      } else if (selectedMeasure == Measurement.imperial) {
                        setState(() {
                          heightIn = newValue.toInt();
                          displayFt = heightIn ~/12;
                          displayIn = (heightIn % 12).toInt();
                        });
                      }
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
                colour: Theme.of(context).primaryColor.withOpacity(1.0),
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
                          selectedMeasure == Measurement.metric ? weight.toString() : weightLbs.toString(),
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
                        HoldDetector(
                          onHold: () {
                            setState(() {
                                if (selectedMeasure == Measurement.metric) {
                                  if (weight > 40)
                                    weight-= 5;
                                } else if (selectedMeasure == Measurement.imperial) {
                                  if (weightLbs > 80)
                                    weightLbs-= 10;
                                }
                              });
                          },
                          child: RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                if (selectedMeasure == Measurement.metric) {
                                  if (weight > 40)
                                    weight--;
                                } else if (selectedMeasure == Measurement.imperial) {
                                  if (weightLbs > 80)
                                    weightLbs--;
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        HoldDetector(
                          onHold: () {
                            setState(() {
                              if (selectedMeasure == Measurement.metric) {
                                if (weight < 200)
                                  weight+= 5;
                              } else if (selectedMeasure == Measurement.imperial) {
                                if (weightLbs < 350)
                                  weightLbs+= 10;
                              }
                            });
                          },
                          child: RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                if (selectedMeasure == Measurement.metric) {
                                  if (weight < 200)
                                    weight++;
                                } else if (selectedMeasure == Measurement.imperial) {
                                  if (weightLbs < 350)
                                    weightLbs++;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                ),
              ),
              Expanded(child: CustomCard(
                colour: Theme.of(context).primaryColor.withOpacity(1.0),
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
                        HoldDetector(
                          onHold: () {
                            setState(() {
                              if (age > 17)
                                age-= 5;
                            });
                          },
                          child: RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                if (age > 17)
                                  age--;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        HoldDetector(
                          onHold: () {
                            setState(() {
                              if (age < 90)
                                age+= 5;
                            });
                          },
                          child: RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                if (age < 90)
                                  age++;
                              });
                            },
                          ),
                        )
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
            colour: Color(0xFFD80422),
            onTap: (){
              Calculator calc;
              if (selectedMeasure == Measurement.metric) {
                calc = Calculator(height: height, weight: weight, measure: selectedMeasure);
              } else {

                calc = Calculator(height: heightIn, weight: weightLbs, measure: selectedMeasure);
              }
              
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


