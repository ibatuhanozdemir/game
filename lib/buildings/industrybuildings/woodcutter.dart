
import 'package:game/resources/industry/industry_resources.dart';

class WoodCutter{

  void collectResources(){
    IndustryResources.industry_resources[0]['wood']=IndustryResources.industry_resources[0]['wood']+1;

  }

}