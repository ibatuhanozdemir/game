import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:flutter/material.dart';

import 'package:game/daycircle.dart';
import 'package:game/kalip_widgetlar/worker_assigning.dart';
import 'package:game/menu2.dart';
import 'package:game/navigation.dart';

import 'package:game/savesystem/save_system.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:rive/rive.dart';

import 'buildings/foodbuildings/food_buildings.dart';
import 'buildings/industrybuildings/industy_buildings.dart';
import 'kalip_widgetlar/citizen_widget.dart';
import 'kalip_widgetlar/exhibition_bottom_sheet.dart';
import 'kalip_widgetlar/custom_app_bar.dart';
import 'menu.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(title: 'river', home: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool get isPlaying => _controller?.isActive ?? false;
  Artboard _riveArtboard;
  RiveAnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.load('images/new_file.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller = SimpleAnimation('Untitled 1'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Giriş'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: 300,
                height: 300,
                child: _riveArtboard == null
                    ? const SizedBox()
                    : Rive(
                        artboard: _riveArtboard,
                        fit: BoxFit.contain,
                      ),
              ),
              RaisedButton(
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyApp2()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
final nav = ChangeNotifierProvider((ref) => Navigation());
final asd3 = ChangeNotifierProvider((ref) => Daycircle());
final aa = ChangeNotifierProvider((ref) => IndustryBuilding());
final town = ChangeNotifierProvider((ref)=> TownServiceBuilding());

class MyApp2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final greeting5 = watch(asd3);
    final navWatch = watch(nav);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF99997A),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.22),
          child: AppBar(
            flexibleSpace: CustomAppBar(),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.005,
              width: MediaQuery.of(context).size.width,
              bottom: MediaQuery.of(context).size.height *0.078,
              child: navWatch.navigation()
            ),
            Menu2(),
            ExhibitionBottomSheet(),
          ],
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
    print(IndustryBuilding.industry_building[index]['upgradereq'].length-1);
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
                child: Image.asset("images/pastorEXPAND.png")),
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
        WorkerAssignDialog(
            context, FoodBuilding.food_building[index], index);
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
        height: MediaQuery.of(context).size.height *
            0.05 *
            MediaQuery.of(context).devicePixelRatio,

        child: Card(
          color: Color(0XFF99997A),
          elevation: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage("images/card.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Image.asset("images/pastorEXPAND.png")),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(
                          IndustryBuilding.industry_building[index]['name'] +
                              '(' +
                              IndustryBuilding.industry_building[index]
                                      ['workercount']
                                  .toString() +
                              "/" +
                              IndustryBuilding.industry_building[index]
                                      ['capacity']
                                  .toString() +
                              ')',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.016),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Req. for Building:',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.016),
                              ),
                              Row(
                                children: [

                                  for (Map aaa in IndustryBuilding
                                      .industry_building[index]['upgradereq'])
                                    Expanded(
                                      child: Text(
                                        aaa['name'] +
                                            ':' +
                                            aaa['count'].toString() +
                                            '  ',
                                        style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(context).size.height *
                                                    0.016),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Text("Qty. " +
                        IndustryBuilding.industry_building[index]['quantity']
                            .toString()),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  IndustryBuilding.industry_building[index]['progres']
                      ? GestureDetector(
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              child: Image.asset('images/build.png')),
                          onTap: () {
                            context.read(aa).buildstart(index);
                          })
                      : RaisedButton(
                          child: Text('Add Builder'),
                          onPressed: () {
                            BuilderAssignDialog(
                                context,
                                'builder' +
                                    IndustryBuilding.industry_building[index]
                                        ['name']);
                          }),
                  IndustryBuilding.industry_building[index]['progres']
                      ? Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.20,
                        )
                      : Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: Stack(children: [

                            LinearProgressIndicator(
                              minHeight:
                                  MediaQuery.of(context).size.height * 0.02,
                              backgroundColor: Colors.red,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.amber,
                              ),
                              value: IndustryBuilding.industry_building[index]
                                      ['buildprogres'] /
                                  IndustryBuilding.industry_building[index]['totalupgradereq'],
                            ),
                            Text(IndustryBuilding.industry_building[index]['buildingprosses1']+IndustryBuilding.industry_building[index]
                            ['buildprogres'].toString()+'/'+
                                IndustryBuilding.industry_building[index]['totalupgradereq'].toString(),style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.height *
                                    0.016)),
                          ]))
                ]),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        WorkerAssignDialog(
            context, IndustryBuilding.industry_building[index]['name'], index);
      },
    );
  }
}

Future<void> WorkerAssignDialog(
    BuildContext context, String workarea, int index) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Builder(


              builder: (context) {return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: WorkerAssigning(context, workarea,index));}),
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

Future<void> BuilderAssignDialog(
    BuildContext context, String workarea) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Builder(


          builder: (context) {return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WorkerAssigningBuilder(context, workarea));}),
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
