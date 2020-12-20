import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:flutter/material.dart';

import 'package:game/daycircle.dart';
import 'package:game/kalip_widgetlar/worker_assigning.dart';

import 'package:game/savesystem/save_system.dart';
import 'package:game/screens/townhall.dart';

import 'buildings/foodbuildings/food_buildings.dart';
import 'buildings/industrybuildings/industy_buildings.dart';
import 'kalip_widgetlar/citizen_widget.dart';
import 'kalip_widgetlar/exhibition_bottom_sheet.dart';
import 'kalip_widgetlar/custom_app_bar.dart';
import 'menu.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(title: 'river', home:MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
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
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => TownHall()));
              }
            },
          ),
        ),
      ),
    );
  }
}

final asd3 = ChangeNotifierProvider((ref) => daycircle());
final aa = ChangeNotifierProvider((ref) => IndustryBuilding());


class MyApp2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final greeting5 = watch(asd3);
    print('deneme');
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: MyHomePage2(),
          backgroundColor: Colors.grey,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.22),
            child: AppBar(
              flexibleSpace: CustomAppBar(),

              bottom: TabBar(
                unselectedLabelColor: Colors.brown,
                isScrollable: true,
                indicatorColor: Colors.brown,
                tabs: [
                  Center(child: Text("Buildings")),
                  Center(child: Text("Other Things")),
                ],
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height * 0.005,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: TabBarView(
                  children: [
                    SecondLayerCustomAppBar("Industry Buildings", "Food Buildings"),
                    SecondLayerCustomAppBar2("Citizen", "ikinciTab"),
                  ],
                ),
              ),
              Positioned(

                child: Text(greeting5.value4),),
              ExhibitionBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}


class FoodBuildingWidgeti extends StatelessWidget {
  int index;

  FoodBuildingWidgeti(this.index);

  @override
  Widget build(BuildContext context) {

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
        showInformationDialog2(
            context, FoodBuilding.food_building[index],index);
      },
    );
  }
}


class IndstryBuildingWidgeti extends ConsumerWidget {
  @override
  int index;

  IndstryBuildingWidgeti(this.index);

  Widget build(BuildContext context, ScopedReader watch) {

    watch(aa);
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height*0.05*MediaQuery.of(context).devicePixelRatio,
        color: Colors.red,
        child: Card(
          color: Colors.grey.shade700,
          elevation: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  //height: MediaQuery.of(context).size.height * 0.16,
                  //width: MediaQuery.of(context).size.width * 0.25,
                  child: Image.asset("images/woodcutter.png")),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(IndustryBuilding.industry_building[index]
                              ['name'] +
                          '('+IndustryBuilding.industry_building[index]['workercount'].toString()+"/"+IndustryBuilding.industry_building[index]['capacity'].toString()+')', style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.016),),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(

                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text('Req= labour:50 wood:20  stone:30',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.016)),
                    ),
                  ],
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Text("Qty. "+IndustryBuilding.industry_building[index]['quantity'].toString()),
                  ),
                ),
                IndustryBuilding.industry_building[index]['progres']
                    ? RaisedButton(
                        child: Text('Build'),
                        onPressed: () {
                          context.read(aa).buildstart(index);
                        })
                    : RaisedButton(
                        child: Text('Add Builder'),
                        onPressed: () {
                          showInformationDialog3(
                              context, 'builder'+IndustryBuilding.industry_building[index]['name']);
                        }),
                IndustryBuilding.industry_building[index]['progres']
                    ? Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.20,
                      )
                    : Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: LinearProgressIndicator(
                          minHeight: MediaQuery.of(context).size.height * 0.02,
                          backgroundColor: Colors.red,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.amber,
                          ),
                          value: IndustryBuilding.industry_building[index]['buildprogres']/IndustryBuilding.industry_building[index]['labourcost'],
                        ))
              ]),
            ],
          ),
        ),
      ),
      onTap: () {
        showInformationDialog2(
            context, IndustryBuilding.industry_building[index]['name'],index);
      },
    );
  }
}

Future<void> showInformationDialog2(
    BuildContext context, String workarea,int index) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: WorkerAssigning(context, workarea,index),
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

Future<void> showInformationDialog3(
    BuildContext context, String workarea) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: WorkerAssigningBuilder(context, workarea),
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
