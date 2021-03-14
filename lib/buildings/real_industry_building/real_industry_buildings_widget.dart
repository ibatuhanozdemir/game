import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/buildings/real_industry_building/real_industry_buildings.dart';
import 'package:game/kalip_widgetlar/custom_dropdown.dart';

import 'package:game/kalip_widgetlar/production_indicator.dart';

import 'package:game/worker/citizen.dart';

import '../../main.dart';


class RealIndustryBuildingWidgeti extends ConsumerWidget {
  @override
  int index;

  RealIndustryBuildingWidgeti(this.index);

  Widget build(BuildContext context, ScopedReader watch) {
    watch(real_industry_buildings_provider);
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        child: Card(
          color: Color(0XFF99997A),
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0XFF99997A),
              image: DecorationImage(
                image: AssetImage("images/card.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/' +
                            RealIndustryBuildings.real_industry_building[index]
                            ['imagename']),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  Widget: Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: Color(0xFFe19f28),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              RealIndustryBuildings.real_industry_building[index]['name'] +
                                  ' ( '  +
                                  RealIndustryBuildings.real_industry_building[index]
                                  ['quantity']
                                      .toString() +
                                  ' )',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Alike",
                                  fontSize:
                                  MediaQuery.of(context).size.height * 0.02),

                            ),
                          ),
                        ),
                        Divider(height: 7,thickness: 1,indent: MediaQuery.of(context).size.width * 0.10,endIndent: MediaQuery.of(context).size.width * 0.10,color: Colors.black54,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Requirements:',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.016),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (Map aaa in RealIndustryBuildings
                                        .real_industry_building[index]['upgradereq'])
                                      Text(
                                        aaa['name'] +
                                            ':' +
                                            aaa['count'].toString(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.016),
                                      ),
                                  ],
                                ),
                                RealIndustryBuildings.real_industry_building[index]['oneoutput']?
                                RealIndustryBuildings.real_industry_building[index]['harvest'] ?
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: CustomProductionProgressIndicator(RealIndustryBuildings.real_industry_building[index]['outputprogress'],RealIndustryBuildings.real_industry_building[index]['totaloutputprogress'], RealIndustryBuildings.real_industry_building[index]['lastdayoutput'], RealIndustryBuildings.real_industry_building[index]['estimatedoutput']),
                                )
                                    :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text("Last output: " + RealIndustryBuildings.real_industry_building[index]['lastdayoutput'].toString(),style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.016),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text("Employee: " + RealIndustryBuildings.real_industry_building[index]['workercount'].toString(),style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.016),),
                                    ),

                                  ],
                                ):  Column(
                                  children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: CustomDropDowm(RealIndustryBuildings.real_industry_building[index]['name']),
                                          ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                                      child: CustomProductionProgressIndicator(RealIndustryBuildings.real_industry_building[index]['outputname'].where((element)=>element['select']==true).toList()[0]['outputprogress'],RealIndustryBuildings.real_industry_building[index]['outputname'].where((element)=>element['select']==true).toList()[0]['totaloutputprogress'], RealIndustryBuildings.real_industry_building[index]['lastdayoutput'],1),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    child: Container(
                      height: MediaQuery.of(context).size.width *
                          0.07,
                      child: Image.asset('images/info.png'),
                    ),
                    onTap: (){
                      showDialog(BuildContext: (context){
                        return InfoAlertRealIndustry(context, RealIndustryBuildings.real_industry_building[index]['explanation']);
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  RealIndustryBuildings.real_industry_building[index]['progres']
                      ? GestureDetector(
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.07,
                          child: Image.asset('images/build.png')),
                      onTap: () {
                        context.read(real_industry_buildings_provider).buildstart(index);
                      })
                      : GestureDetector(
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.07,
                          child: Image.asset('images/addperson.png')),
                      onTap: () {
                        BuilderAssignRealIndustryDialog(
                            context,
                            'builder' +
                                RealIndustryBuildings.real_industry_building[index]['name']);
                      }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: RealIndustryBuildings.real_industry_building[index]['progres']
                        ? Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.17,
                    )
                        : Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.17,
                        child: Stack(children: [
                          LinearProgressIndicator(
                            minHeight:
                            MediaQuery.of(context).size.height * 0.02,
                            backgroundColor: Colors.red,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.amber,
                            ),
                            value: RealIndustryBuildings.real_industry_building[index]
                            ['buildprogres'] /
                                RealIndustryBuildings.real_industry_building[index]
                                ['totalupgradereq'],
                          ),
                          Text(
                              RealIndustryBuildings.real_industry_building[index]
                              ['buildingprosses1'] +
                                  RealIndustryBuildings.real_industry_building[index]
                                  ['buildprogres']
                                      .toString() +
                                  '/' +
                                  RealIndustryBuildings.real_industry_building[index]
                                  ['totalupgradereq']
                                      .toString(),
                              style: TextStyle(
                                  fontSize:
                                  MediaQuery.of(context).size.height *
                                      0.016)),
                        ])),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        WorkerAssignRealIndustryDialog(
            context, RealIndustryBuildings.real_industry_building[index]['name'], index);
      },
    );
  }
}

Future<void> WorkerAssignRealIndustryDialog(
    BuildContext context, String workarea, int index) async {
  return await showDialog(
      BuildContext: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WorkerAssigningRealIndustry(context, workarea, index));
          }),
        );
      });
}

Future<void> BuilderAssignRealIndustryDialog(
    BuildContext context, String workarea) async {
  return await showDialog(
      BuildContext: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WorkerAssigningRealIndustryBuilder(context, workarea));
          }),
        );
      });
}

class WorkerAssigningRealIndustry extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigningRealIndustry(this.context, this.workarea, this.index);

  @override
  _WorkerAssigningRealIndustryState createState() =>
      _WorkerAssigningRealIndustryState(context, workarea, index);
}

class _WorkerAssigningRealIndustryState extends State<WorkerAssigningRealIndustry> {
  @override
  BuildContext context;
  int index;
  _WorkerAssigningRealIndustryState(this.context, this.workarea, this.index);
  List employedworker = [];
  List unemployedworker = [];
  String workarea;
  bool loading = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    eleme();
  }

  @override
  Widget build(BuildContext context) {
    context = widget.context;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage("images/AppBar2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(14, 12, 14, 0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              Widget: Center(child: Text('Assigned Worker')),
            ),
            Expanded(
              flex: 6,
              Widget: Container(
                child: ListView.builder(
                    IndexedWidgetBuilder: (_, index) {
                      return AssignedWorker(context, index);
                    },
                    itemExtent: employedworker.length.toDouble()),
              ),
            ),
            Expanded(
                flex: 1,
                Widget: Center(
                    child: Text('Assign Worker (' +
                        RealIndustryBuildings.real_industry_building[index]['workercount']
                            .toString() +
                        "/" +
                        RealIndustryBuildings.real_industry_building[index]['capacity']
                            .toString() +
                        ')'))),
            Expanded(
              flex: 6,
              Widget: Container(
                child: ListView.builder(
                    IndexedWidgetBuilder: (_, index) {
                      return AssignWorker(context, index);
                    },
                    itemExtent: unemployedworker.length.toDouble()),
              ),
            ),
            Expanded(
              flex: 1,
              Widget: GestureDetector(child:Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    color: Color(0xFFe19f28),
                  ),

                  child: Center(child: Text("Done")),
                ),
              ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
              ),

            )
          ],
        ),
      ),
    );
  }

  Widget AssignedWorker(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Row(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: Icon(Icons.people)),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              Widget: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(employedworker[index]['name']),
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
        this.IstenCikarma(employedworker[index]['id']);
      },
    );
  }

  Widget AssignWorker(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Row(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: Icon(Icons.people)),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              Widget: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(unemployedworker[index]['name']),
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
        this.IseAlma(unemployedworker[index]['id'], workarea);
      },
    );
  }

  void IstenCikarma(int id) {
    Citizen.citizen.forEach((element) {
      if (element['id'] == id) {
        setState(() {
          element['workarea'] = 'unemployed';
          eleme();
   
          RealIndustryBuildings.real_industry_building.forEach((element3) {
            element3['workercount'] = Citizen.citizen
                .where((element) => (element['workarea'] == element3['name']))
                .toList()
                .length;
          });
        });
      }
    });
  }

  void IseAlma(int id, String workarea_name) {
    List a = RealIndustryBuildings.real_industry_building
        .where((element) => element['name'] == workarea_name)
        .toList();
    if (a[0]['workercount'] < a[0]['capacity']) {
      Citizen.citizen.forEach((element) {
        if (element['id'] == id) {
          setState(() {
            element['workarea'] = workarea_name;
            eleme();
            RealIndustryBuildings.real_industry_building.forEach((element3) {
              element3['workercount'] = Citizen.citizen
                  .where((element) => (element['workarea'] == element3['name']))
                  .toList()
                  .length;
            });
          });
        }
      });
    }
    ;

    a = [];
  }

  void eleme() {

    employedworker = Citizen.citizen.where((element2) => element2['age']>=calisma_yasi).toList()
        .where((element) => (element['workarea'] == workarea))
        .toList();

    unemployedworker = Citizen.citizen.where((element2) => element2['age']>=calisma_yasi).toList()
        .where((element) => (element['workarea'] == 'unemployed'))
        .toList();

    loading = true;
  }
}

class WorkerAssigningRealIndustryBuilder extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigningRealIndustryBuilder(this.context, this.workarea);

  @override
  _WorkerAssigningRealIndustryBuilderState createState() =>
      _WorkerAssigningRealIndustryBuilderState(context, workarea);
}

class _WorkerAssigningRealIndustryBuilderState
    extends State<WorkerAssigningRealIndustryBuilder> {
  @override
  BuildContext context;

  _WorkerAssigningRealIndustryBuilderState(this.context, this.workarea);
  List employedworker = [];
  List unemployedworker = [];
  String workarea;
  bool loading = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    eleme(workarea);
  }

  @override
  Widget build(BuildContext context) {
    context = widget.context;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage("images/AppBar2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(14, 12, 14, 0),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                Widget: Text('Assigned Worker')),
            Expanded(
              flex:6,
              Widget: ListView.builder(
                  IndexedWidgetBuilder: (_, index) {
                    return AssignedWorker(context, index);
                  },
                  itemExtent: employedworker.length.toDouble()),
            ),
            Expanded(
                flex: 1,
                Widget: Text('Assign Worker')),
            Expanded(
              flex: 6,
              Widget: ListView.builder(
                  IndexedWidgetBuilder: (_, index) {
                    return AssignWorker(context, index);
                  },
                  itemExtent: unemployedworker.length.toDouble()),
            ),
            Expanded(
              flex: 1,
              Widget: GestureDetector(child:Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    color: Color(0xFFe19f28),
                  ),

                  child: Center(child: Text("Done")),
                ),
              ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
              ),

            )

          ],
        ),
      ),
    );
  }

  Widget AssignedWorker(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Row(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: Icon(Icons.people)),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              Widget: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(employedworker[index]['name']),
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
        this.IstenCikarma(employedworker[index]['id'], workarea);
      },
    );
  }

  Widget AssignWorker(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Row(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: Icon(Icons.people)),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              Widget: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(unemployedworker[index]['name']),
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
        this.IseAlma(unemployedworker[index]['id'], workarea);
      },
    );
  }

  void IstenCikarma(int id, String workarea_name) {
    Citizen.citizen.forEach((element) {
      if (element['id'] == id) {
        setState(() {
          element['workarea'] = 'unemployed';
          eleme(workarea_name);
        });
      }
    });
  }

  void IseAlma(int id, String workarea_name) {

    Citizen.citizen.forEach((element) {
      if (element['id'] == id) {
        setState(() {
          element['workarea'] = workarea_name;
          eleme(workarea_name);
        });
      }
    });
  }

  void eleme(String workarea_name) {
    employedworker = Citizen.citizen.where((element2) => element2['age']>=calisma_yasi).toList()
        .where((element) => (element['workarea'] == workarea_name))
        .toList();
    unemployedworker = Citizen.citizen.where((element2) => element2['age']>=calisma_yasi).toList()
        .where((element) => (element['workarea'] == 'unemployed'))
        .toList();

    loading = true;
  }
}

class InfoAlertRealIndustry extends StatelessWidget {
  @override
  final BuildContext context;
  final String info;
  InfoAlertRealIndustry(this.context, this.info);
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFe19f28),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Text(info),
      ),
    );
  }
}
