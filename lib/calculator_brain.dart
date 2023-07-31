import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0;

  // ignore: missing_return
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1); // toFixed(2) is used to round off the value to 2 decimal places
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi <
        18.5) // we can also use else instead of else if(_bmi >= 18.5 && _bmi < 25)
    {
      return 'Underweight';
    } else {
      return 'Normal';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi <
        18.5) // we can also use else instead of else if(_bmi >= 18.5 && _bmi < 25)
    {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    } else {
      return 'You have a normal body weight. Good job!';
    }
  }
}