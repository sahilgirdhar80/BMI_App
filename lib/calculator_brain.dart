import 'dart:math';

double _bmi = 0;

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});
  final int height;
  final int weight;
  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to excercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job';
    } else {
      return 'You have a lower than normal body weight. You ca eat a bit more';
    }
  }
}
