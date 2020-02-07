import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/components/measure.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holding_gesture/holding_gesture.dart';

enum ActivityLevel {
  basalRate0,
  lowIntensity1,
  lightExercise2,
  moderateExercise3,
  active4,
  extreme5,
}


class BMRInputPage extends StatefulWidget {
  @override
  _BMRInputPageState createState() => _BMRInputPageState();
}

class _BMRInputPageState extends State<BMRInputPage> {
  Measurement _selectedMeasure = Measurement.metric;
  ActivityLevel _selectedActivity = ActivityLevel.basalRate0;
  bool _isMale = true;
  int age = 18;
  
  int height = 180;
  int weight = 60;

  int displayFt = 6;
  int displayIn = 7;
  int weightLbs = 150;
  int heightIn = 80;


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
        children: <Widget>[
          SafeArea(child: Row(
            children: <Widget>[
              Expanded(
                child: CustomCard(
                  onPress: (){
                    setState(() {
                      if (_selectedMeasure == Measurement.imperial)
                        _selectedMeasure = Measurement.metric;
                      else
                        _selectedMeasure = Measurement.imperial;
                    });
                  },
                  colour: _selectedMeasure == Measurement.metric ?
                    Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: IconContent(
                      cardIconData: FontAwesomeIcons.weightHanging,
                      iconSize: 40.0,
                      cardText: _selectedMeasure == Measurement.metric ? 'METRIC' : 'IMPERIAL',
                    ),
                  ),
                ),
              ),
            Expanded(
              child: CustomCard(
                onPress: (){
                  setState(() {
                    if (_isMale)
                      _isMale = false;
                    else
                      _isMale = true;
                  });
                },
                colour: _isMale ?
                  Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.6),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: IconContent(
                    cardIconData: _isMale ? FontAwesomeIcons.male : FontAwesomeIcons.female,
                    iconSize: 40.0,
                    cardText: _isMale ? 'MALE' : 'FEMALE',
                    ),
                ),
                ),
              ),
            ],
          ),
        ),
        CustomCard(
            colour: Theme.of(context).primaryColor.withOpacity(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 6.0)),
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle
                ),
                Padding(padding: EdgeInsets.only(top: 2.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      _selectedMeasure == Measurement.metric ? height.toString() : '${displayFt.toString()},${displayIn.toString()}',
                      style: kNumberTextStyle,
                    ),
                    Text(
                      _selectedMeasure == Measurement.metric ? 'cm' : 'ft,in',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    overlayColor: Colors.greenAccent,
                    thumbColor: Colors.lightGreen,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: _selectedMeasure == Measurement.metric ? height.toDouble() : heightIn.toDouble(),
                    min: _selectedMeasure == Measurement.metric ? 120.0 : 48.0,
                    max: _selectedMeasure == Measurement.metric ? 210.0 : 80.0,
                    onChanged: (double newValue) {
                      if (_selectedMeasure == Measurement.metric) {
                        setState(() {
                          height = newValue.round();
                        });
                      } else if (_selectedMeasure == Measurement.imperial) {
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
          
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: CustomCard(
                colour: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: TextStyle(
                        fontSize: 18.0, color: Color(0xFF8D8E98)
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        SizedBox(width: 18.0,),
                        Text(
                          _selectedMeasure == Measurement.metric ? weight.toString() : weightLbs.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          _selectedMeasure == Measurement.metric ? 'kg' : 'lbs',
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
                                if (_selectedMeasure == Measurement.metric) {
                                  if (weight > 40)
                                    weight-= 5;
                                } else if (_selectedMeasure == Measurement.imperial) {
                                  if (weightLbs > 80)
                                    weightLbs-= 10;
                                }
                              });
                          },
                          child: RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                if (_selectedMeasure == Measurement.metric) {
                                  if (weight > 40)
                                    weight--;
                                } else if (_selectedMeasure == Measurement.imperial) {
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
                              if (_selectedMeasure == Measurement.metric) {
                                if (weight < 200)
                                  weight+= 5;
                              } else if (_selectedMeasure == Measurement.imperial) {
                                if (weightLbs < 350)
                                  weightLbs+= 10;
                              }
                            });
                          },
                          child: RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                if (_selectedMeasure == Measurement.metric) {
                                  if (weight < 200)
                                    weight++;
                                } else if (_selectedMeasure == Measurement.imperial) {
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
              Expanded(
                child: CustomCard(
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
                        style: kNumberTextStyle
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
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    'Activity Level',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              DropdownButton<ActivityLevel>(
                value: _selectedActivity,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                underline: Container(
                  height: 2,
                  color: Colors.lightGreenAccent
                ),
                onChanged: (ActivityLevel value) {
                  setState(() {
                    _selectedActivity = value;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: ActivityLevel.basalRate0,
                    child: Text('Basal Metabolic Rate'),
                  ),
                  DropdownMenuItem(
                    value: ActivityLevel.lowIntensity1,
                    child: Text('Low Intensity 1 day/wk')
                  ),
                  DropdownMenuItem(
                    value: ActivityLevel.lightExercise2,
                    child: Text('Light Exercise 2 day/wk')
                  ),
                  DropdownMenuItem(
                    value: ActivityLevel.moderateExercise3,
                    child: Text('Moderate Exercise 3 day/wk')
                  ),
                  DropdownMenuItem(
                    value: ActivityLevel.active4,
                    child: Text('Active Job & Exercise 3-5d/wk')
                  ),
                  DropdownMenuItem(
                    value: ActivityLevel.extreme5,
                    child: Text('Active Job & Exercise 55-6d/wk')
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(right: 10.0)),
            ],
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            colour: Colors.green[600],
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}