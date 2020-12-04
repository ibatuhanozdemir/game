import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:game/food.dart';
import 'package:game/resources.dart';

class deneme extends ChangeNotifier{
  int start = 5;
  int get value1 => start;





  void foodplus(){

    food.food_count++;
    Resources.ert[0]['food']++;
    notifyListeners();
  }

  void startTimer() {

    const oneSec = const Duration(seconds: 1);
    notifyListeners();
    Timer.periodic(oneSec,(Timer timer){
      if (start < 1) {


      start=5;

      food.food_count++;

      food().kaydet();
      notifyListeners();

      timer.cancel();

    } else {
      start = start - 1;

      notifyListeners();
    }});





  }
}