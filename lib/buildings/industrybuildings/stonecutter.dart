import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';

class StoneCutter{

  void collectResources(){
    int worker=Citizen.citizen.where((element) => element['workarea'].contains('stonecutter')).toList().length;
    IndustryResources.industry_resources[1]['stone']=IndustryResources.industry_resources[1]['stone']+worker*3;

  }

}