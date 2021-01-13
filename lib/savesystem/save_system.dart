import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game/buildings/foodbuildings/food_buildings.dart';
import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:game/worker/citizen.dart';
import '../daycircle.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SaveSystem {
  Future<void> save(String resource_save_name, int resource_name) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt(resource_save_name, resource_name);
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

  Future<void> saveFood() async{
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('foodcount', FoodResources.foodCount);
    prefs.setString('foodsublist', jsonEncode(FoodResources.food_resource_sublist));
  }

  Future<int> loadFoodSublist() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('foodsublist');

    if (startupNumber == null) {
      FoodResources.food_resource_sublist = FoodResources.food_resource_sublist;

      return 0;
    }
    FoodResources.food_resource_sublist= jsonDecode(startupNumber);

    return 0;
  }

  Future<int> loadFoodCount() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('foodcount');

    if (startupNumber == null) {
      FoodResources.foodCount = FoodResources.foodCount;

      return 0;
    }
    FoodResources.foodCount= startupNumber;

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


    await IndustryResources.industry_resources_name.forEach((element) async {
      await save(
          element,
          IndustryResources.industry_resources[
                  IndustryResources.industry_resources_name.indexOf(element)]
              [element]);
    });
    await kaydet();
    await saveFood();
    IndustryBuilding().save();
    TownServiceBuilding().save();
    Citizen().save();
    FoodBuilding().save();
    await saveEvents();
  }

  Future<int> getResources() async {


    await IndustryResources.industry_resources_name.forEach((element) async {
      await loadIndustry(
          element, IndustryResources.industry_resources_name.indexOf(element));
    });
    await getIntFromSharedPref();
    await loadFoodSublist();
    await loadFoodCount();
    Citizen().loadCitizen();
    IndustryBuilding().loadIndustryBuilding();
    TownServiceBuilding().loadTownServiceBuilding();
    FoodBuilding().loadFoodBuilding();
    loadEvents();
    return 0;
  }
}
