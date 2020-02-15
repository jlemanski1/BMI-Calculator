import 'package:bmi_calculator/pages/bmr_input.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'measure.dart';

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

class BMRCalculator {
  final int weight;
  final int height;
  final int age;
  final bool isMale;
  final Measurement measure;
  final ActivityLevel level;

  double _bmr;
  String _bmrInterpretation;

  BMRCalculator({
    @required this.weight,
    @required this.height,
    @required this.age,
    @required this.isMale,
    @required this.measure,
    @required this.level
  });


  //TODO double check that the formula is correct (Especially imperial)
  // Calculates and returns the bmr
  double getBMR(){
    if (measure == Measurement.metric) {
      if (isMale) {
        _bmr = 66.47 + (13.75 * weight) + (5 * height) - (6.75 * age);
      } else if (!isMale) {
        _bmr = 665.09 + (9.56 * weight) + (1.84 * height) - (4.67 * age);
      }
    } else if (measure == Measurement.imperial) {
      if (isMale) {
        _bmr = 66.47 + (13.75 * (weight / 2.2)) + (5 * (height * 2.54)) - (6.75 * age);
      } else if (!isMale) {
        _bmr = 665.09 + (9.56 * (weight / 2.2)) + (1.84 * (height *2.54)) - (4.67 * age);
      }
    }
    return _bmr;
  }


  // Calculates the user's adjusted BMR and returns a list with both the
  // adjusted bmr and the result interpretation.
  List<dynamic> getResult() {
    getBMR();
    switch (level) {
      case ActivityLevel.basalRate0:
        _bmrInterpretation = '';
        break;
      case ActivityLevel.lowIntensity1:
        _bmr *= 1.2;
        _bmrInterpretation = '';
        break;
      case ActivityLevel.lightExercise2:
        _bmr *= 1.375;
        _bmrInterpretation = '';
        break;
      case ActivityLevel.moderateExercise3:
        _bmr *= 1.55;
        _bmrInterpretation = '';
        break;
      case ActivityLevel.active4:
        _bmr *= 1.725;
        _bmrInterpretation = '';
        break;
      case ActivityLevel.extreme5:
        _bmr *= 1.8;
        _bmrInterpretation = '';
        break;
    }

    return [_bmr.round(), _bmrInterpretation];
  }
}