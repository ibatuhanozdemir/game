import 'dart:math';
import 'package:flutter_riverpod/all.dart';
import 'package:game/daycircle.dart';
import 'package:game/screens/townhall.dart';

import 'main.dart';
class RandomEvents{

  int month = Daycircle.mounth;


  final _random = new Random();
  int next(min, int max) => min + _random.nextInt(max - min);

  eventOccurrence(){
  int prob = next(0, 1001);
  int deciderHot = next(0, 3);
  int deciderCold = next(0,2);
  if(prob<=50){
    if(month>6 && month<=9){
    if(deciderHot==0){
      deprem();
    }else if(deciderHot==1){
      salgin();
    }else if(deciderHot==2){
      yangin();
    }
  }else{
    if(deciderCold==0){
      deprem();
    }else if(deciderCold ==1){
      salgin();
    }
  }
  }


  }

  deprem(){
    TownHall.events.add("Earthquake!");
  }


  yangin(){TownHall.events.add("Fire");}
  salgin(){TownHall.events.add("Contagious disease occurred in town");}
}