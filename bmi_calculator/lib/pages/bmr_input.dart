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
  int age = 18;
  
  int height = 180;
  int weight = 60;

  int displayFt = 6;
  int displayIn = 7;
  int weightLbs = 150;
  int heightIn = 80;

  // Formula requirements
  //  weight and height
  //  age in years
  //  Activity level modifier

  /*
      BMR FORMULA
      W = weight in kilograms (weight (lbs)/2.2) =weight in kg
      H = height in centimeters (inches x 2.54) =height in cm
      A = age in years

      Men: BMR=66.47+ (13.75 x W) + (5.0 x H) - (6.75 x A)
      Women: BMR=665.09 + (9.56 x W) + (1.84 x H) - (4.67 x A)
      
      MODIFIERS:
      BMR x 1.2 for low intensity activities and leisure activities (primarily sedentary)
      BMR x 1.375 for light exercise (leisurely walking for 30-50 minutes 3-4 days/week, golfing, house chores)
      BMR x 1.55 for moderate exercise 3-5 days per week (60-70% MHR for 30-60 minutes/session)
      BMR x 1.725 for active individuals (exercising 6-7 days/week at moderate to high intensity (70-85% MHR) 
        for 45-60 minutes/session)
      BMR x 1.9 for the extremely active individuals (engaged in heavy/intense exercise like heavy manual 
        labor, heavy lifting, endurance athletes, and competitive team sports athletes 6-7 days/week for 
        90 + minutes/session)
  */


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
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: CustomCard(
                  onPress: (){
                    setState(() {
                      _selectedMeasure = Measurement.metric;
                    });
                  },
                  colour: _selectedMeasure == Measurement.metric ?
                    Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.6),
                  child: IconContent(
                    cardIconData: FontAwesomeIcons.pencilRuler,
                    iconSize: 60.0,
                    cardText: 'METRIC',
                  ),
                ),
              ),
            Expanded(
              child: CustomCard(
                onPress: (){
                  setState(() {
                    _selectedMeasure = Measurement.imperial;
                  });
                },
                colour: _selectedMeasure == Measurement.imperial ?
                  Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.6),
                child: IconContent(
                  cardIconData: FontAwesomeIcons.rulerCombined,
                  iconSize: 60.0,
                  cardText: 'IMPERIAL',
                  ),
                ),
              ),
            ],
          ),
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
                      style: kLabelTextStyle,
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
                        style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.w900
                        ),
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
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Activity Level'),
                ),
                PopupMenuButton<ActivityLevel>(
                  onSelected: (ActivityLevel result) {
                    setState(() {
                      _selectedActivity = result;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<ActivityLevel>>[
                    const PopupMenuItem<ActivityLevel>(
                      value: ActivityLevel.basalRate0,
                      child: Text('Basal Metabolic Rate'),
                    ),
                  ],
                ),
              ],
            ),
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