import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    }

    return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'Good job. You have a normal body weight.';
    }

    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}