import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:game/resources.dart';
import 'package:game/wood.dart';

class deneme2 extends ChangeNotifier{
  int start = 5;
  int get value1 => start;




  void woodplus(){

    wood.wood_count++;
    Resources.ert[0]['wood']++;
    notifyListeners();
  }


  void startTimer() {

    const oneSec = const Duration(seconds: 1);
    notifyListeners();
    Timer.periodic(oneSec,(Timer timer){
      if (start < 1) {


        start=5;

        wood.wood_count++;
        wood().kaydet();
        notifyListeners();

        timer.cancel();

      } else {
        start = start - 1;

        notifyListeners();
      }});





  }
}