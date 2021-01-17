import 'dart:convert';
import 'dart:math';

import 'package:game/daycircle.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:game/worker/citizen_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Citizen {
  static int globalHealth = 0;

  static List citizen = [
    {
      'id': 1,
      'name': 'tayfun vural',
      'workarea': 'unemployed',
      'workfield': '',
      'gender': 'female',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes',
      'hunger': 'yes'
    },
    {
      'id': 2,
      'name': 'batuhan özdemir',
      'workarea': 'unemployed',
      'workfield': '',
      'gender': 'female',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes',
      'hunger': 'yes'
    },
    {
      'id': 3,
      'name': 'batuhan özdemir2',
      'workarea': 'unemployed',
      'workfield': '',
      'gender': 'male',
      'health': 90,
      'happiness': 80,
      'overallef': 70,
      'age': 40,
      'tool': 'copper axe',
      'cloth': 'jean',
      'education': 'yes',
      'hunger': 'yes'
    },
    {
      'id': 4,
      'name': 'batuhan özdemir2',
      'workarea': 'unemployed',
      'workfield': '',
      'gender': 'male',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes',
      'hunger': 'yes'
    },
    {
      'id': 5,
      'name': 'batuhan özdemir2',
      'workarea': 'unemployed',
      'gender': 'male',
      'health': 60,
      'happiness': 80,
      'overallef': 40,
      'age': 50,
      'tool': 'iron axe',
      'cloth': 'leather',
      'education': 'yes',
      'hunger': 'yes'
    }
  ];

  static int citizenCapacity = 10;
  int min = 0;

  citizenCapacityCalculator(){
    citizenCapacity = TownServiceBuilding.town_service_building.where((element) => element['name']=='house').toList()[0]['quantity']*TownServiceBuilding.town_service_building.where((element) => element['name']=='house').toList()[0]['capacity'];
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
          'gender': gender == 1 ? 'male' : 'female',
          'health': 100,
          'happiness': 100,
          'overallef': 100,
          'age': 0,
          'tool': 'nothing',
          'cloth': 'nothing',
          'education': 'no',
          'hunger': 'yes'
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
}
