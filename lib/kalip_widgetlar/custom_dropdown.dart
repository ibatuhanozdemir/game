import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/buildings/real_industry_building/real_industry_buildings.dart';

import '../main.dart';

class CustomDropDowm extends ConsumerWidget {
String building_name;

CustomDropDowm(this.building_name);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(real_industry_buildings_provider);
    return Container(
      height: MediaQuery.of(context).size.height * 0.02,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(

            value: RealIndustryBuildings.real_industry_building.where((element) => element['name']==building_name).toList()[0]['dropdownitemvalue'],
            items: <DropdownMenuItem<int>>[

              for (Map sub_product in RealIndustryBuildings.real_industry_building.where((element) => element['name']==building_name).toList()[0]['outputname'])
             CustomDropDownMenuItem(sub_product['name'], RealIndustryBuildings.real_industry_building.where((element) => element['name']==building_name).toList()[0]['outputname'].indexOf(sub_product),building_name,context),
            ],
            onChanged: (dynamic value) {
              context
                  .read(real_industry_buildings_provider)
                  .customDropDownChanger(value,building_name);
            },
          ),
        ),
      );


  }
  Widget CustomDropDownMenuItem(String sub_product_name,int value,String building_name,BuildContext context){
   return DropdownMenuItem(

     child: Container(
       height: MediaQuery.of(context).size.height * 0.03,
       child: Text(sub_product_name,style: TextStyle(
           fontSize: MediaQuery.of(context)
               .size
               .height *
               0.016),),
     ),
     value: value,
     onTap: (){
       context.read(real_industry_buildings_provider).customDropSubProdutcSelector(building_name, sub_product_name);


     },
   );


  }
}
