import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:flutter/material.dart';

import 'package:game/daycircle.dart';
import 'package:game/kalip_widgetlar/worker_assigning.dart';
import 'package:game/resources/food/food_resources.dart';

import 'package:game/savesystem/save_system.dart';

import 'buildings/foodbuildings/food_buildings.dart';
import 'buildings/industrybuildings/industy_buildings.dart';
import 'kalip_widgetlar/exhibition_bottom_sheet.dart';
import 'kalip_widgetlar/main_interface.dart';
import 'kalip_widgetlar/time_widget.dart';
import 'kalip_widgetlar/top_resource_widget.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(title: 'river', home: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            "Tab bar tamam ama altındaki widgetlar yordu biraz. Onları da bir tek liste haline getiricem",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Cinzel"),
          ),
          onPressed: () async {
            dynamic result2 = await SaveSystem().getResources();
            context.read(asd3).startTimer();
            if (result2 == null) {
              print('error');
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp2()));
            }
          },
        ),
      ),
    );
  }
}

final asd3 = ChangeNotifierProvider((ref) => daycircle());

class MyApp2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final greeting5 = watch(asd3);
    List<String> tabNames = [
      "Industry",
      "Food",
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
          child: AppBar(
            flexibleSpace: CustomAppBar(),
            title: Text(
              "Tayfun's Town",
              style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 25,
                  fontFamily: "Ewert"),
            ),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Center(child: Text("Industry Buildings")),
                Center(child: Text("Food Buildings")),
              ],
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.01,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
                child: TabBarView(
                  children: [
                    ListView.builder(
                        itemBuilder: (_, index) {
                          return IndstryBuildingWidgeti(context, index);
                        },
                        itemCount: IndustryBuilding.industry_building.length),
                    ListView.builder(
                        itemBuilder: (_, index) {
                          return FoodBuildingWidgeti(context, index);
                        },
                        itemCount: FoodBuilding.food_building.length),
                  ],
                ),

            ),
            ExhibitionBottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget IndstryBuildingWidgeti(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Row(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.height * 0.16,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Image.asset("images/woodcutter.png")),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(IndustryBuilding.industry_building[index]),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.height * 0.05,
              child: Text("1"),
            ),
          ],
        ),
      ),
      onTap: () {
        showInformationDialog(
            context, IndustryBuilding.industry_building[index]);
      },
    );
  }

  Widget FoodBuildingWidgeti(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Row(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.height * 0.16,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Image.asset("images/woodcutter.png")),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(FoodBuilding.food_building[index]),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.height * 0.05,
              child: Text("1"),
            ),
          ],
        ),
      ),
      onTap: () {
        showInformationDialog(
            context, IndustryBuilding.industry_building[index]);
      },
    );
  }

  Future<void> showInformationDialog(
      BuildContext context, String workarea) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: WorkerAssigning(context, workarea),
            actions: [
              GestureDetector(
                child: Center(child: Text("Done")),
                onTap: () {
                  Navigator.pop;
                },
              )
            ],
          );
        });
  }
}

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
                child: Icon(Icons.pause),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 2, 8, 8),
                child: Icon(Icons.play_arrow),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        ],
      ),
    );
  }
}
