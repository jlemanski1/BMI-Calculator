import 'dart:math';

import 'package:flutter/widgets.dart';

// Responsible for calculating the BMI of a user inputted height and weight
class Calculator {
  final int height;
  final int weight;
  
  double _bmi;

  Calculator({this.height, this.weight});

  // Calculate BMI and return as string with 1 decimal point
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  // Returns a result based on the BMI value calculated
  String getResult() {
    if (_bmi >= 40) {
      return 'Extremely Obese';
    } else if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Healthy Weight';
    } else {
      return 'Underweight';
    }
    
  }

  // Returns an interpretation/advice based on the BMI value calculated
  String getInterpretation() {
    
    if (_bmi >= 40) {
      return 'You have are at an extremely high risk for type 2 diabetes, hypertension, and cardiovascular diseease. Go to your doctor for assistance.';
    } else if (_bmi >= 30) {
      return 'You have a high risk for type 2 diabetes, hypertension, and cardiovascular diseease. Exercise more and restrict your caloric intake.';
    } else if (_bmi >= 25) {
      return 'Exercise more and decrease your caloric intake to prevent an increased risk of type 2 diabetes, hypertension, and cardiovascular disease.';
    } else if (_bmi >= 18.5) {
      return "Keep up the active lifestyle, you're doing great!";
    } else {
      return 'You should increase your caloric intake, and keep exercising to properly fuel your body,';
    }
  }

  // Returns a colour for the result text based on the calculated bmi
  Color getResultColour() {
    if (_bmi >= 40) {
      return Color(0xFFDD2C00); // Extremely Obese (Red)
    } else if (_bmi >= 30) {
      return Color(0xFFE65100); // Obese (Deep Orange)
    } else if (_bmi >= 25) {
      return Color(0xFFEF6C00); // Overweight (Orange)
    } else if (_bmi >= 18.5) {
      return Color(0xFF24D876); // Healthy(Green)
    } else {
      return Color(0xFFFFA726);     // Underweight (Yellowy)
    }
  }
  
}