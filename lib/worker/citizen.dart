import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Citizen {
  static List citizen = [
    {
      'id': 1,
      'name': 'tayfun vural',
      'workarea': 'woodcutter',
      'gender': 'female',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes'
    },
    {
      'id': 2,
      'name': 'batuhan özdemir',
      'workarea': 'woodcutter',
      'gender': 'female',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes'
    },
    {
      'id': 3,
      'name': 'batuhan özdemir2',
      'workarea': 'stonecutter',
      'gender': 'male',
      'health': 90,
      'happiness': 80,
      'overallef': 70,
      'age': 40,
      'tool': 'copper axe',
      'cloth': 'jean',
      'education': 'yes'
    },
    {
      'id': 4,
      'name': 'batuhan özdemir2',
      'workarea': 'stonecutter',
      'gender': 'male',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes'
    },
    {
      'id': 5,
      'name': 'batuhan özdemir2',
      'workarea': 'stonecutter',
      'gender': 'male',
      'health': 60,
      'happiness': 80,
      'overallef': 40,
      'age': 50,
      'tool': 'iron axe',
      'cloth': 'leather',
      'education': 'yes'
    }
  ];

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

  void incrementAge(){
    citizen.forEach((element) {element['age']=element['age']+1;});


  }
}
