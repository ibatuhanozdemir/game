
import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';
import '../daycircle.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SaveSystem {

  Future<void> save(String resource_save_name,int resource_name )async{
    final prefs= await SharedPreferences.getInstance();

    prefs.setInt(resource_save_name, resource_name);


  }
  Future<int> loadFood(String resource_save_name,int index) async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber =  prefs.getInt(resource_save_name);



    if (startupNumber == null) {
     FoodResources.food_resource_sublist_count[index][resource_save_name]=0;

      return 0;

    }

    FoodResources.food_resource_sublist_count[index][resource_save_name]=startupNumber;

    return 0;
  }
  Future<int> loadIndustry(String resource_save_name,int index) async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber =  prefs.getInt(resource_save_name);


    if (startupNumber == null) {
      IndustryResources.industry_resources[index][resource_save_name]=0;

      return 0;

    }

    IndustryResources.industry_resources[index][resource_save_name]=startupNumber;

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

    await FoodResources.food_resource_sublist_name.forEach((element)async {
      await save(element, FoodResources.food_resource_sublist_count[FoodResources.food_resource_sublist_name.indexOf(element)][element]);


    });



    await IndustryResources.industry_resources_name.forEach((element)async {
      await save(element, IndustryResources.industry_resources[IndustryResources.industry_resources_name.indexOf(element)][element]);

    });
    await kaydet();
   IndustryBuilding().save();
    Citizen().save();
  }

  Future<int> getResources()async{

    await FoodResources.food_resource_sublist_name.forEach((element)async {
      await loadFood(element,FoodResources.food_resource_sublist_name.indexOf(element));


    });



    await IndustryResources.industry_resources_name.forEach((element)async {
      await loadIndustry(element, IndustryResources.industry_resources_name.indexOf(element));

    });
    await getIntFromSharedPref();
    Citizen().loadCitizen();
    IndustryBuilding().loadIndustryBuilding();
    return 0;
  }

}