import 'package:flutter/cupertino.dart';

class IndustryBuilding extends ChangeNotifier {
  static List industry_building = [
    {'name': 'woodcutter', 'progres': true},
    {'name': 'stonecutter', 'progres': true}
  ];

  void build(int index) {
    IndustryBuilding.industry_building[index]['progres'] = false;
    notifyListeners();
  }
}
