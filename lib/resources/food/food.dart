import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources.dart';

class food extends ChangeNotifier{


Future<void> kaydet()async{
  final prefs= await SharedPreferences.getInstance();
  notifyListeners();
  prefs.setInt('foodCount', Resources.food_resources[0]['food']);
}
  Future<int> getIntFromSharedPref() async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('foodCount');
    if (startupNumber == null) {
      Resources.food_resources[0]['food']=0;

      return 0;

    }
    Resources.food_resources[0]['food']=startupNumber;

    return 0;
  }

  void foodplus(){
    Resources.food_resources[0]['food']++;
    notifyListeners();
  }
}