import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/buildings/foodbuildings/food_buildings.dart';
import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/daycircle.dart';
import 'package:game/kalip_widgetlar/exhibition_appbar_sheet.dart';
import 'package:game/main.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/worker/citizen.dart';

import 'time_widget.dart';
import 'top_resource_widget.dart';

class CustomAppBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final greeting5 = watch(asd3);
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage("images/appbar.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height *0.06,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                Widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget('food', 'tomato',
                          FoodResources.foodCount.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget(
                          'Total health',
                          "heart" +
                              (() {
                                if (Citizen.globalHealth <= 20) {
                                  return "20";
                                } else if (Citizen.globalHealth <= 40) {
                                  return "40";
                                } else if (Citizen.globalHealth <= 60) {
                                  return "60";
                                } else if (Citizen.globalHealth <= 80) {
                                  return "80";
                                } else if (Citizen.globalHealth <= 100) {
                                  return "100";
                                }
                              })(),
                          Citizen.globalHealth.toString()),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                Widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget(
                          'Popul.',
                          'population',
                          Citizen.citizen.length.toString() +
                              "/" +
                              Citizen.citizenCapacity.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget(
                          'Wood',
                          'wood',
                          IndustryResources.industry_resources[0]['count']
                              .toString()),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                Widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget('Happ. ', 'laugh',
                          Citizen.globalHappiness.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget(
                          'Wood',
                          'wood',
                          IndustryResources.industry_resources[0]['count']
                              .toString()),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 0, 5),
                child: TimeWidget(
                    greeting5.value1.toString(),
                    greeting5.value2.toString(),
                    greeting5.value3.toString(),
                    greeting5.value2),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 3, 8),
                    child: GestureDetector(
                      child: (() {
                        if (Daycircle.stop == 0) {
                          return Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.04,
                              child: Image.asset('images/pauseoff.png'));
                        } else {
                          return Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.04,
                              child: Image.asset('images/pauseon.png'));
                        }
                      })(),
                      onTap: () {
                        context.read(asd3).stop2();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 2, 8, 8),
                    child: GestureDetector(
                      child: (() {
                        if (Daycircle.stop == 1) {
                          return Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.04,
                              child: Image.asset('images/playoff.png'));
                        } else {
                          return Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.04,
                              child: Image.asset('images/playon.png'));
                        }
                      })(),
                      onTap: () {
                        Daycircle.stop = 0;
                        context.read(asd3).startTimer();
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.04,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.005,
          ),
        ],
      ),
    );
  }
}