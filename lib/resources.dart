


import 'package:game/daycircle.dart';
import 'package:game/resources/food/food.dart';
import 'package:game/resources/industry/stone.dart';
import 'package:game/resources/industry/wood.dart';

class Resources {



static List food_resources=[{"food":0}];
static List industry_resources=[{"wood":0,'stone':0}];

static List food_resources_name=["food"];
static List industry_resources_name=["wood","stone"];

void updateResources(){
  wood().woodplus();
  food().foodplus();
  stone().stoneplus();
}

void saveResources(){
wood().kaydet();
food().kaydet();
stone().kaydet();

}

Future<int> getResources()async{
  daycircle().getIntFromSharedPref();
await wood().getIntFromSharedPref();
await food().getIntFromSharedPref();
  await stone().getIntFromSharedPref();
return 0;
}

}