import 'dart:convert';
import 'dart:math';

import 'package:game/daycircle.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:game/worker/citizen_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Citizen {
  static int globalHealth = 0;
  static int globalHappiness=0;
  static List citizen = [
    {
      'id': 1,
      'name': 'tayfun vural',
      'workarea': 'unemployed',
      'workfield': 'unemployed',
      'gender': 'female',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': {'name':'Wooden axe','braketime':20,'hastool':true,'efficiency':30},
      'cloth': {'name':'leather cloth','braketime':20,'hascloth':true,'efficiency':20},
      'education': 'yes',
      'hunger': 'yes',
      'happinessstatus':[{'name':'church','status':'no'},{'name':'tavern','status':'no'},{'name':'hospital','status':'no'},{'name':'well','status':'no'},]
    },
    {
      'id': 2,
      'name': 'batuhan özdemir',
      'workarea': 'unemployed',
      'workfield': 'unemployed',
      'gender': 'female',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': {'name':'Wooden axe','braketime':20,'hastool':true,'efficiency':30},
      'cloth': {'name':'leather cloth','braketime':20,'hascloth':true,'efficiency':20},
      'education': 'yes',
      'hunger': 'yes',
      'happinessstatus':[{'name':'church','status':'no'},{'name':'tavern','status':'no'},{'name':'hospital','status':'no'},{'name':'well','status':'no'},]
    },
    {
      'id': 3,
      'name': 'batuhan özdemir2',
      'workarea': 'unemployed',
      'workfield': 'unemployed',
      'gender': 'male',
      'health': 90,
      'happiness': 80,
      'overallef': 70,
      'age': 40,
      'tool': {'name':'Wooden axe','braketime':20,'hastool':true,'efficiency':30},
      'cloth': {'name':'leather cloth','braketime':20,'hascloth':true,'efficiency':20},
      'education': 'yes',
      'hunger': 'yes',
      'happinessstatus':[{'name':'church','status':'no'},{'name':'tavern','status':'no'},{'name':'hospital','status':'no'},{'name':'well','status':'no'},]
    },
    {
      'id': 4,
      'name': 'batuhan özdemir2',
      'workarea': 'unemployed',
      'workfield': 'unemployed',
      'gender': 'male',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': {'name':'Wooden axe','braketime':20,'hastool':true,'efficiency':30},
      'cloth': {'name':'leather cloth','braketime':20,'hascloth':true,'efficiency':20},
      'education': 'yes',
      'hunger': 'yes',
      'happinessstatus':[{'name':'church','status':'no'},{'name':'tavern','status':'no'},{'name':'hospital','status':'no'},{'name':'well','status':'no'},]
    },
    {
      'id': 5,
      'name': 'batuhan özdemir2',
      'workarea': 'unemployed',
      'workfield': 'unemployed',
      'gender': 'male',
      'health': 60,
      'happiness': 80,
      'overallef': 40,
      'age': 50,
      'tool': {'name':'Wooden axe','braketime':20,'hastool':true,'efficiency':30},
      'cloth': {'name':'leather cloth','braketime':20,'hascloth':true,'efficiency':20},
      'education': 'yes',
      'hunger': 'yes',
      'happinessstatus':[{'name':'church','status':'no'},{'name':'tavern','status':'no'},{'name':'hospital','status':'no'},{'name':'well','status':'no'},]
    }
  ];

  static int citizenCapacity = 10;
  int min = 0;

  citizenCapacityCalculator(){
    citizenCapacity = TownServiceBuilding.town_service_building.where((element) => element['name']=='HOUSE').toList()[0]['quantity']*TownServiceBuilding.town_service_building.where((element) => element['name']=='HOUSE').toList()[0]['capacity'];
  }


  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('citizen', jsonEncode(citizen));
  }

  Future<int> loadCitizen() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('citizen');

    if (startupNumber == null) {
      citizen = citizen;

      return 0;
    }
    citizen = jsonDecode(startupNumber);

    return 0;
  }

  void incrementAge() {
    citizen.forEach((element) {
      element['age'] = element['age'] + 1;
    });
  }

  void citizenBirth() {
    if (citizen.length < citizenCapacity) {
      if (next(0, 101) > 80) {
        int gender = next(0, 2);

        Map newCitizen = {
          'id': citizen[citizen.length - 1]["id"] + 1,
          'name': gender == 0
              ? CitizenNames.femaleNames[
                      next(min, CitizenNames.femaleNames.length - 1)] +
                  " " +
                  CitizenNames
                      .surnames[next(min, CitizenNames.surnames.length - 1)]
              : CitizenNames
                      .maleNames[next(min, CitizenNames.maleNames.length - 1)] +
                  " " +
                  CitizenNames
                      .surnames[next(min, CitizenNames.surnames.length - 1)],
          'workarea': 'unemployed',
          'workfield': 'unemployed',
          'gender': gender == 1 ? 'male' : 'female',
          'health': 100,
          'happiness': 100,
          'overallef': 100,
          'age': 0,
          'tool': {'name':'nothing','braketime':0,'hastool':false,'efficiency':30},
          'cloth': {'name':'nothing','braketime':0,'hascloth':false,'efficiency':20},
          'education': 'no',
          'hunger': 'yes',
          'happinessstatus':[{'name':'church','status':'no'},{'name':'tavern','status':'no'},{'name':'hospital','status':'no'},{'name':'well','status':'no'},]
        };
        citizen.add(newCitizen);
        TownHall.events.add(Daycircle.day.toString() +
            "/" +
            Daycircle.mounth.toString() +
            "/" +
            Daycircle.year.toString() +
            " : " +
            newCitizen['name'] +
            " was born.");
        newCitizen = {};
      }
    }
  }

  void citizenDeath() {
    List deaths = [];
    citizen.forEach((element) {
      if (element['age'] >= 60 && element['age'] < 70) {
        if (next(1, 101) <= 5) {
          TownHall.events.add(Daycircle.day.toString() +
              "/" +
              Daycircle.mounth.toString() +
              "/" +
              Daycircle.year.toString() +
              " : " +
              element['name'] +
              " died at age of " +
              element['age'].toString());
          deaths.add(element);
        }
      } else if (element['age'] >= 70 && element['age'] < 80) {
        if (next(1, 101) <= 10) {
          TownHall.events.add(Daycircle.day.toString() +
              "/" +
              Daycircle.mounth.toString() +
              "/" +
              Daycircle.year.toString() +
              " : " +
              element['name'] +
              " died at age of " +
              element['age'].toString());
          deaths.add(element);
        }
      } else if (element['age'] >= 80 && element['age'] < 90) {
        if (next(1, 101) <= 20) {
          TownHall.events.add(Daycircle.day.toString() +
              "/" +
              Daycircle.mounth.toString() +
              "/" +
              Daycircle.year.toString() +
              " : " +
              element['name'] +
              " died at age of " +
              element['age'].toString());
          deaths.add(element);
        }
      } else if (element['age'] >= 90) {
        if (next(1, 101) <= 70) {
          TownHall.events.add(Daycircle.day.toString() +
              "/" +
              Daycircle.mounth.toString() +
              "/" +
              Daycircle.year.toString() +
              " : " +
              element['name'] +
              " died at age of " +
              element['age'].toString());
          deaths.add(element);
        }
      }
    });

    citizen.removeWhere((element) => deaths.contains(element));
  }

  final _random = new Random();
  int next(min, int max) => min + _random.nextInt(max - min);

  void calculateGlobalHealth() {
    globalHealth = 0;
    citizen.forEach((element) {
      globalHealth = globalHealth + element['health'];
    });
    double a = globalHealth / citizen.length;
    globalHealth = a.toInt();
  }

  void calculateCitizenHappiness(){

    //BaseHappinessCalculation
    citizen.forEach((element) {
      if(element['age']<=30){
        element['happiness']=40;
        element['happinessstatus'][0]['status']='no';
        element['happinessstatus'][1]['status']='no';
        element['happinessstatus'][2]['status']='no';
        element['happinessstatus'][3]['status']='no';
      }else if(element['age']<=40){
        element['happiness']=35;
        element['happinessstatus'][0]['status']='no';
        element['happinessstatus'][1]['status']='no';
        element['happinessstatus'][2]['status']='no';
        element['happinessstatus'][3]['status']='no';
      }else if(element['age']<=50){
        element['happiness']=30;
        element['happinessstatus'][0]['status']='no';
        element['happinessstatus'][1]['status']='no';
        element['happinessstatus'][2]['status']='no';
        element['happinessstatus'][3]['status']='no';
      }else if(element['age']<=60){
        element['happiness']=25;
        element['happinessstatus'][0]['status']='no';
        element['happinessstatus'][1]['status']='no';
        element['happinessstatus'][2]['status']='no';
        element['happinessstatus'][3]['status']='no';
      }else if(element['age']<=70){
        element['happiness']=20;
        element['happinessstatus'][0]['status']='no';
        element['happinessstatus'][1]['status']='no';
        element['happinessstatus'][2]['status']='no';
        element['happinessstatus'][3]['status']='no';
      }else if(element['age']<=80){
        element['happiness']=15;
        element['happinessstatus'][0]['status']='no';
        element['happinessstatus'][1]['status']='no';
        element['happinessstatus'][2]['status']='no';
        element['happinessstatus'][3]['status']='no';
      }else if(element['age']<=90){
        element['happiness']=10;
        element['happinessstatus'][0]['status']='no';
        element['happinessstatus'][1]['status']='no';
        element['happinessstatus'][2]['status']='no';
        element['happinessstatus'][3]['status']='no';
      }else{element['happiness']=5;
      element['happinessstatus'][0]['status']='no';
      element['happinessstatus'][1]['status']='no';
      element['happinessstatus'][2]['status']='no';
      element['happinessstatus'][3]['status']='no';}
    });//BaseHappinessCalculation

    //Church Happiness Effect
    for(int i=0;i<TownServiceBuilding.town_service_building[1]['effectcitizencount'];i++){
        if(citizen.where((element) => element['happinessstatus'][0]['status']=='no').toList().length>0) {
        int aa = citizen.indexOf(citizen.where((element) => element['happinessstatus'][0]['status'] == 'no').toList()[
                next(0, citizen.where((element) => element['happinessstatus'][0]['status'] == 'no').toList().length)]);
        citizen[aa]['happiness'] = citizen[aa]['happiness'] + 15;
        citizen[aa]['happinessstatus'][0]['status'] = 'yes';
      }
    }

    //Tavern Happiness Effect
    for(int i=0;i<TownServiceBuilding.town_service_building[2]['effectcitizencount'];i++){
      if(citizen.where((element) => element['happinessstatus'][1]['status']=='no').toList().length>0) {
        int aa = citizen.indexOf(citizen.where((element) => element['happinessstatus'][1]['status'] == 'no').toList()[
        next(0, citizen.where((element) => element['happinessstatus'][1]['status'] == 'no').toList().length)]);
        citizen[aa]['happiness'] = citizen[aa]['happiness'] + 15;
        citizen[aa]['happinessstatus'][1]['status'] = 'yes';
      }
    }
    //Hospital Happiness Effect
    for(int i=0;i<TownServiceBuilding.town_service_building[3]['effectcitizencount'];i++){
      if(citizen.where((element) => element['happinessstatus'][2]['status']=='no').toList().length>0) {
        int aa = citizen.indexOf(citizen.where((element) => element['happinessstatus'][2]['status'] == 'no').toList()[
        next(0, citizen.where((element) => element['happinessstatus'][2]['status'] == 'no').toList().length)]);
        citizen[aa]['happiness'] = citizen[aa]['happiness'] + 15;
        citizen[aa]['happinessstatus'][2]['status'] = 'yes';
      }
    }
//Well Happiness Effect
    for(int i=0;i<TownServiceBuilding.town_service_building[4]['effectcitizencount'];i++){
      if(citizen.where((element) => element['happinessstatus'][3]['status']=='no').toList().length>0) {
        int aa = citizen.indexOf(citizen.where((element) => element['happinessstatus'][3]['status'] == 'no').toList()[
        next(0, citizen.where((element) => element['happinessstatus'][3]['status'] == 'no').toList().length)]);
        citizen[aa]['happiness'] = citizen[aa]['happiness'] + 15;
        citizen[aa]['happinessstatus'][3]['status'] = 'yes';
      }
    }



  }

  void calculateGlobalHappiness(){
    globalHappiness = 0;
    citizen.forEach((element) {
      globalHappiness = globalHappiness + element['happiness'];
    });
    double a = globalHappiness / citizen.length;
    globalHappiness = a.toInt();
  }





}
