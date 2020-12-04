import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class food extends ChangeNotifier{
  static int food_count ;
  int get value1 => food_count;

Future<void> kaydet()async{
  final prefs= await SharedPreferences.getInstance();
  notifyListeners();
  prefs.setInt('foodCount', food_count);
}
  Future<int> getIntFromSharedPref() async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('foodCount');
    if (startupNumber == null) {
      food_count=0;

      return 0;

    }
    food_count=startupNumber;

    return 0;
  }
}