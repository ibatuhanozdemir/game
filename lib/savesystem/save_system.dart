import 'dart:convert';

import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/worker/citizen.dart';
import '../daycircle.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SaveSystem {
  Future<void> save(String resource_save_name, int resource_name) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt(resource_save_name, resource_name);
  }

  Future<int> loadFood(String resource_save_name, int index) async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt(resource_save_name);

    if (startupNumber == null) {
      FoodResources.food_resource_sublist_count[index][resource_save_name] = 0;

      return 0;
    }

    FoodResources.food_resource_sublist_count[index][resource_save_name] =
        startupNumber;

    return 0;
  }

  Future<int> loadIndustry(String resource_save_name, int index) async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt(resource_save_name);

    if (startupNumber == null) {
      IndustryResources.industry_resources[index][resource_save_name] = 0;

      return 0;
    }

    IndustryResources.industry_resources[index][resource_save_name] =
        startupNumber;

    return 0;
  }

  Future<void> kaydet() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('day', Daycircle.day);
    prefs.setInt('mounth', Daycircle.mounth);
    prefs.setInt('year', Daycircle.year);
  }

  Future<int> getIntFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumberday = prefs.getInt('day');
    final startupNumbermounth = prefs.getInt('mounth');
    final startupNumberyear = prefs.getInt('year');

    if (startupNumberday == null) {
      Daycircle.day = 0;
      Daycircle.year = 0;
      Daycircle.mounth = 0;
      return 0;
    }
    Daycircle.day = startupNumberday;
    Daycircle.mounth = startupNumbermounth;
    Daycircle.year = startupNumberyear;

    return 0;
  }

  Future<void> saveEvents() async{
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('events', jsonEncode(TownHall.events));
  }

  Future<int> loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('events');

    if (startupNumber == null) {
      TownHall.events = TownHall.events;

      return 0;
    }
    TownHall.events = jsonDecode(startupNumber);

    return 0;
  }

  Future<void> AllSave() async {
    await FoodResources.food_resource_sublist_name.forEach((element) async {
      await save(
          element,
          FoodResources.food_resource_sublist_count[
                  FoodResources.food_resource_sublist_name.indexOf(element)]
              [element]);
    });

    await IndustryResources.industry_resources_name.forEach((element) async {
      await save(
          element,
          IndustryResources.industry_resources[
                  IndustryResources.industry_resources_name.indexOf(element)]
              [element]);
    });
    await kaydet();
    IndustryBuilding().save();
    Citizen().save();
    saveEvents();
  }

  Future<int> getResources() async {
    await FoodResources.food_resource_sublist_name.forEach((element) async {
      await loadFood(
          element, FoodResources.food_resource_sublist_name.indexOf(element));
    });

    await IndustryResources.industry_resources_name.forEach((element) async {
      await loadIndustry(
          element, IndustryResources.industry_resources_name.indexOf(element));
    });
    await getIntFromSharedPref();
    Citizen().loadCitizen();
    IndustryBuilding().loadIndustryBuilding();
    loadEvents();
    return 0;
  }
}
