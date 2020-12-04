import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class wood extends ChangeNotifier{
  static int wood_count ;
  int get value1 => wood_count;

  Future<void> kaydet()async{
    final prefs= await SharedPreferences.getInstance();
    notifyListeners();
    prefs.setInt('woodCount', wood_count);
  }
  Future<int> getIntFromSharedPref() async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('woodCount');
    if (startupNumber == null) {
      wood_count=0;

      return 0;

    }
    wood_count=startupNumber;

    return 0;
  }
}