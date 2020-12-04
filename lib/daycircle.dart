import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:game/deneme.dart';
import 'package:game/food.dart';

import 'deneme2.dart';

class daycircle extends ChangeNotifier{
  int daycycle = 1;
  int get value1 => day;
  int get value2 => mounth;
  int get value3 => year;
  int day=0;
  int mounth = 0;
  int year = 0;





  void startTimer() {

    const oneSec = const Duration(seconds: 1);
    notifyListeners();
    Timer.periodic(oneSec,(Timer timer){
      if (daycycle < 1) {


        day++;

        if(day>10){
          day=0;
          mounth++;
          if(mounth>2){
            mounth=0;
            year++;}}

        daycycle=1;
        deneme().foodplus();
        deneme2().woodplus();
        notifyListeners();

        timer.cancel();
        startTimer();
      } else {
        daycycle = daycycle - 1;

        notifyListeners();
      }});





  }
}