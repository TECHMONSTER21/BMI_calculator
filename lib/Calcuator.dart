import 'dart:math';

class Calculator{
  Calculator({required this.height, required this.weight});
  final int height;
  final int weight;
   late double _bmi;


  double bmi_calc(){
    _bmi=weight/pow(height/100, 2);
    return _bmi;
  }

  String textresult(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

}