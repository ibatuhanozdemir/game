
import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';

class WoodCutter{

  void collectResources(){

    int worker=IndustryBuilding.industry_building[0]['workercount'];
    IndustryResources.industry_resources[0]['wood']=IndustryResources.industry_resources[0]['wood']+worker*5;

  }

}