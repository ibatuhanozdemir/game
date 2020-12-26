import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/buildings/foodbuildings/food_buildings.dart';
import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/daycircle.dart';
import 'package:game/main.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';

import 'time_widget.dart';
import 'top_resource_widget.dart';

class CustomAppBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final greeting5 = watch(asd3);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Tayfun's Town",
            style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: MediaQuery.of(context).size.height * 0.05,
                fontFamily: "Hanalei"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget(
                          'food',
                          'tomato',
                          FoodResources.food_resources_count[0]['food']
                              .toString()),
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
              SizedBox(width: 10,),
              Expanded(
                child: Column(
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
                          'wood',
                          'wood',
                          IndustryResources.industry_resources[0]['wood']
                              .toString()),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget(
                          'Happ. ',
                          'laugh',
                          Citizen.citizen.length.toString() +
                              "/" +
                              Citizen.citizenCapacity.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopResourceWidget(
                          'wood',
                          'wood',
                          IndustryResources.industry_resources[0]['wood']
                              .toString()),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimeWidget(
                  greeting5.value1.toString(),
                  greeting5.value2.toString(),
                  greeting5.value3.toString(),
                  greeting5.value2),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 3, 8),
                    child: GestureDetector(
                      child: (() {
                        if (Daycircle.stop == 0) {
                          return Icon(Icons.pause, color: Colors.black);
                        } else {
                          return Icon(Icons.pause, color: Colors.red);
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
                          return Icon(Icons.play_arrow, color: Colors.black);
                        } else {
                          return Icon(Icons.play_arrow, color: Colors.red);
                        }
                      })(),
                      onTap: () {
                        Daycircle.stop = 0;
                        context.read(asd3).startTimer();
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
        ],
      ),
    );
  }
}

class SecondLayerCustomAppBar extends StatefulWidget {
  String ilkTab;
  String ikinciTab;
  SecondLayerCustomAppBar(this.ilkTab, this.ikinciTab);
  @override
  _SecondLayerCustomAppBarState createState() =>
      _SecondLayerCustomAppBarState();
}

class _SecondLayerCustomAppBarState extends State<SecondLayerCustomAppBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: AppBar(
              backgroundColor: Colors.grey,
              title: TabBar(
                unselectedLabelColor: Colors.brown,
                isScrollable: true,
                indicatorColor: Colors.brown,
                tabs: [
                  Text(widget.ilkTab),
                  Text(widget.ikinciTab),
                ],
              ),
              centerTitle: true,
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemBuilder: (_, index) {
                    return IndstryBuildingWidgeti(index);
                  },
                  itemCount: IndustryBuilding.industry_building.length),
              ListView.builder(
                  itemBuilder: (_, index) {
                    return FoodBuildingWidgeti(index);
                  },
                  itemCount: FoodBuilding.food_building.length),
            ],
          ),
        ));
  }
}
