import 'package:game/resources/industry/industry_resources.dart';

class StoneCutter{

  void collectResources(){
    IndustryResources.industry_resources[1]['stone']=IndustryResources.industry_resources[1]['stone']+1;

  }

}