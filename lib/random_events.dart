import 'dart:math';
import 'package:flutter_riverpod/all.dart';
import 'package:game/daycircle.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:game/worker/citizen.dart';

import 'main.dart';
class RandomEvents{

  int month = Daycircle.mounth;
  int evSayisi = TownServiceBuilding.town_service_building[0]['quantity'];

  final _random = new Random();
  int next(min, int max) => min + _random.nextInt(max - min);

  eventOccurrence(){
  int prob = next(0, 1001);
  int deciderHot = next(0, 3);
  int deciderCold = next(0,2);
  if(prob<=300){
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
    double yikilacakEvsayisi = evSayisi<50 ? evSayisi/10: evSayisi/20;
    int gercekYikimSayisi = yikilacakEvsayisi.toInt();
    print(evSayisi.toString());
    for(int i=0; i<gercekYikimSayisi*3; i++){
      Citizen.citizen.where((element) => element['shelter']=='yes').toList()[i]['shelter']='no';
    }
  }


  yangin(){

    TownHall.events.add("Fire");


  }
  salgin(){TownHall.events.add("Contagious disease occurred in town");}
}
