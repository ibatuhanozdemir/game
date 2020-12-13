import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/daycircle.dart';
import 'package:game/main.dart';
import 'package:game/resources/food/food_resources.dart';


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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                        'food',
                        'tomato',
                        FoodResources.food_resources_count[0]['food']
                            .toString()),
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
                  TimeWidget(greeting5.value1.toString(), greeting5.value2.toString(), greeting5.value3.toString(), greeting5.value2),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 3, 8),
                child: GestureDetector(child: Icon(Icons.pause),
                  onTap: (){daycircle.stop=1; },),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 2, 8, 8),
                child: GestureDetector(child: Icon(Icons.play_arrow),
                  onTap: (){daycircle.stop=0;context.read(asd3).startTimer();},),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        ],
      ),
    );
  }
}
