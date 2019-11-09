import 'dart:math';

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
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // Returns an interpretation/advice based on the BMI value calculated
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more while watching your diet.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight, keep it up!';
    } else {
      return 'You have a lower than normal body weight. You can increase your caloric intake.';
    }
  }
}