import 'package:game/resources/industry/industry_resources.dart';


import 'industy_buildings.dart';

class StoneCutter{

  void collectResources(){
    int worker=IndustryBuilding.industry_building[1]['workercount'];
    IndustryResources.industry_resources[1]['stone']=IndustryResources.industry_resources[1]['stone']+worker*3;

  }

}