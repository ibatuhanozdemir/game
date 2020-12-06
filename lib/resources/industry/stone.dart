import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources.dart';

class stone extends ChangeNotifier{


  Future<void> kaydet()async{
    final prefs= await SharedPreferences.getInstance();
    notifyListeners();
    prefs.setInt('stoneCount', Resources.industry_resources[0]['stone']);
  }
  Future<int> getIntFromSharedPref() async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('stoneCount');
    if (startupNumber == null) {
      Resources.industry_resources[0]['stone']=0;

      return 0;

    }
    Resources.industry_resources[0]['stone']=startupNumber;

    return 0;
  }

  void stoneplus(){
    Resources.industry_resources[0]['stone']++;
    notifyListeners();
  }
}