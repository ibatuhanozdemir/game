import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/resources/food/food_resources.dart';


import 'kalip_widgetlar/time_widget.dart';
import 'kalip_widgetlar/top_resource_widget.dart';

class MainInterface extends StatelessWidget {
  MainInterface(this.day, this.month, this.year, this.season);
  String day;
  String month;
  String year;
  int season;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.99,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade500,
                  //border: Border.all(width: 3, color: Color(0xFFB78516)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white, spreadRadius: 3, blurRadius: 7)
                  ]),
              child: Column(
                children: [
                  Text(
                    "Tayfun's Town",
                    style: TextStyle(
                        color: Colors.grey.shade200,
                        fontSize: 25,
                        fontFamily: "Ewert"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TopResourceWidget('food', 'tomato',
                                FoodResources.food_resources_count[0]['food'].toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TopResourceWidget('food', 'tomato',
                                FoodResources.food_resources_count[0]['food'].toString()),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TopResourceWidget('wood', 'wood', '0'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TopResourceWidget('wood', 'wood', '0'),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TimeWidget(day, month, year, season),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.pause),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.play_arrow),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
