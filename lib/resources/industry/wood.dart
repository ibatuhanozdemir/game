import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources.dart';

class wood extends ChangeNotifier{


  Future<void> kaydet()async{
    final prefs= await SharedPreferences.getInstance();
    notifyListeners();
    prefs.setInt('woodCount', Resources.industry_resources[0]['wood']);
  }
  Future<int> getIntFromSharedPref() async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('woodCount');
    if (startupNumber == null) {
      Resources.industry_resources[0]['wood']=0;

      return 0;

    }
    Resources.industry_resources[0]['wood']=startupNumber;

    return 0;
  }

  void woodplus(){
    Resources.industry_resources[0]['wood']++;
    notifyListeners();
  }
}