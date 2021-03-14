import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/buildings/stroragebuildings/storage_buildings.dart';
import 'package:game/kalip_widgetlar/production_indicator.dart';

import 'package:game/worker/citizen.dart';

import '../../main.dart';

class StorageBuildingWidgeti extends ConsumerWidget {
  @override
  int index;

  StorageBuildingWidgeti(this.index);

  Widget build(BuildContext context, ScopedReader watch) {
    watch(storage_building_provider);
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      child: GestureDetector(
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
                            StorageBuilding.storage_building[index]
                                ['imagename']),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  Widget: Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                        color: Color(0xFFe19f28)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              StorageBuilding.storage_building[index]['name'] +
                                  ' ( ' +
                                  StorageBuilding.storage_building[index]
                                  ['quantity']
                                      .toString() +
                                  ' )',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Alike",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            ),
                          ),
                        ),
                        Divider(
                          height: 7,
                          thickness: 1,
                          indent: MediaQuery.of(context).size.width * 0.1,
                          endIndent: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.black54,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (Map aaa in StorageBuilding
                                        .storage_building[index]['upgradereq'])
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
                      height: MediaQuery.of(context).size.width * 0.07,
                      child: Image.asset('images/info.png'),
                    ),
                    onTap: () {
                      showDialog(
                          BuildContext: (context) {
                            return InfoAlertStorage(
                                context,
                                StorageBuilding.storage_building[index]
                                    ['explanation']);
                          });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  StorageBuilding.storage_building[index]['progres']
                      ? GestureDetector(
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              child: Image.asset('images/build.png')),
                          onTap: () {
                            context
                                .read(storage_building_provider)
                                .buildstart(index);
                          })
                      : GestureDetector(
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              child: Image.asset('images/addperson.png')),
                          onTap: () {
                            BuilderAssignStorageDialog(
                                context,
                                'builder' +
                                    StorageBuilding.storage_building[index]
                                        ['name']);
                          }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: StorageBuilding.storage_building[index]['progres']
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
                                value: StorageBuilding.storage_building[index]
                                        ['buildprogres'] /
                                    StorageBuilding.storage_building[index]
                                        ['totalupgradereq'],
                              ),
                              Text(
                                  StorageBuilding.storage_building[index]
                                          ['buildingprosses1'] +
                                      StorageBuilding.storage_building[index]
                                              ['buildprogres']
                                          .toString() +
                                      '/' +
                                      StorageBuilding.storage_building[index]
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
    );
  }
}

Future<void> BuilderAssignStorageDialog(
    BuildContext context, String workarea) async {
  return await showDialog(
      BuildContext: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WorkerAssigningStorageBuilder(context, workarea));
          }),
        );
      });
}

class WorkerAssigningStorageBuilder extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigningStorageBuilder(this.context, this.workarea);

  @override
  _WorkerAssigningStorageBuilderState createState() =>
      _WorkerAssigningStorageBuilderState(context, workarea);
}

class _WorkerAssigningStorageBuilderState
    extends State<WorkerAssigningStorageBuilder> {
  @override
  BuildContext context;

  _WorkerAssigningStorageBuilderState(this.context, this.workarea);
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
            Expanded(flex: 1, Widget: Text('Assigned Worker')),
            Expanded(
              flex: 6,
              Widget: ListView.builder(
                  IndexedWidgetBuilder: (_, index) {
                    return AssignedWorker(context, index);
                  },
                  itemExtent: employedworker.length.toDouble()),
            ),
            Expanded(flex: 1, Widget: Text('Assign Worker')),
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
              Widget: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
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
    employedworker = Citizen.citizen
        .where((element2) => element2['age'] >= calisma_yasi)
        .toList()
        .where((element) => (element['workarea'] == workarea_name))
        .toList();
    unemployedworker = Citizen.citizen
        .where((element2) => element2['age'] >= calisma_yasi)
        .toList()
        .where((element) => (element['workarea'] == 'unemployed'))
        .toList();

    loading = true;
  }
}

class InfoAlertStorage extends StatelessWidget {
  @override
  final BuildContext context;
  final String info;

  InfoAlertStorage(this.context, this.info);

  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFe19f28),
      content: Container(
        color: Colors.transparent,
        child: Text(info),
      ),
    );
  }
}
