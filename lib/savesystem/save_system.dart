import 'package:flutter/cupertino.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';
import '../daycircle.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SaveSystem {

  Future<void> save(String resource_save_name,int resource_name )async{
    final prefs= await SharedPreferences.getInstance();

    Future<bool> resut = prefs.setInt(resource_save_name, resource_name);

  }
  Future<int> load(String resource_save_name,int resource_name) async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber =  prefs.getInt(resource_save_name);


    if (startupNumber == null) {
     resource_name=0;

      return 0;

    }

    resource_name=startupNumber;

    return 0;
  }
  Future<void> kaydet() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('day', daycircle.day);
    prefs.setInt('mounth', daycircle.mounth);
    prefs.setInt('year', daycircle.year);

  }

  Future<int> getIntFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumberday = prefs.getInt('day');
    final startupNumbermounth = prefs.getInt('mounth');
    final startupNumberyear = prefs.getInt('year');

    if (startupNumberday == null) {
      daycircle.day = 0;
      daycircle.year = 0;
      daycircle.mounth = 0;
      return 0;
    }
    daycircle.day = startupNumberday;
    daycircle.mounth = startupNumbermounth;
    daycircle.year = startupNumberyear;

    return 0;
  }


  Future<void> AllSave()async{
    int i=0;
    await FoodResources.food_resource_sublist_name.forEach((element)async {
      await save(element, FoodResources.food_resource_sublist_count[i][element]);

      i=i+1;
    });


    int a=0;
    await IndustryResources.industry_resources_name.forEach((element)async {
      await save(element, IndustryResources.industry_resources[a][element]);
      a=a+1;
    });
    await kaydet();
   

  }

  Future<int> getResources()async{
    int i=0;
    await FoodResources.food_resource_sublist_name.forEach((element)async {
      await load(element, FoodResources.food_resource_sublist_count[i][element]);

      i=i+1;
    });

    int a=0;
    await IndustryResources.industry_resources_name.forEach((element)async {
      await load(element, IndustryResources.industry_resources[a][element]);

      a=a+1;
    });
    await getIntFromSharedPref();

    return 0;
  }
}