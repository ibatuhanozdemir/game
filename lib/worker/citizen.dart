import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Citizen{
  static List citizen=[{'id':1,'name':'tayfun vural','workarea':'woodcutter'},{'id':2,'name':'batuhan özdemir','workarea':'woodcutter'},{'id':3,'name':'batuhan özdemir2','workarea':'stonecutter'},{'id':4,'name':'batuhan özdemir2','workarea':'stonecutter'},{'id':5,'name':'batuhan özdemir2','workarea':'stonecutter'}];


  Future<void> save( )async{
    final prefs= await SharedPreferences.getInstance();

    prefs.setString('citizen',jsonEncode(citizen) );


  }
  Future<int> loadCitizen() async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber =  prefs.getString('citizen');



    if (startupNumber == null) {
      citizen=citizen;

      return 0;

    }
    citizen=jsonDecode(startupNumber);


    return 0;
  }
}

