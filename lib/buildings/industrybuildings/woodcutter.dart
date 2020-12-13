
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';

class WoodCutter{

  void collectResources(){

    int worker=Citizen.citizen.where((element) => element['workarea'].contains('woodcutter')).toList().length;
    IndustryResources.industry_resources[0]['wood']=IndustryResources.industry_resources[0]['wood']+worker*5;

  }

}