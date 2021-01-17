import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:game/worker/citizen.dart';

import '../../main.dart';
import 'food_buildings.dart';


class FoodBuildingWidgeti extends ConsumerWidget {
  @override
  int index;

  FoodBuildingWidgeti(this.index);

  Widget build(BuildContext context, ScopedReader watch) {
    watch(food_building_provider);
    return FoodBuilding.food_building[index]['harvest'] ?  GestureDetector(
      child: Container(
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
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/' +
                                FoodBuilding.food_building[index]
                                ['imagename']),
                          ),
                        ),
                      ),
                    ),
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
                              FoodBuilding.food_building[index]['name'] +
                                  '('  +
                                  "Qty. " +
                                  FoodBuilding.food_building[index]
                                  ['quantity']
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
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.016),
                                ),
                                Row(
                                  children: [
                                    for (Map aaa in FoodBuilding.food_building[index]['upgradereq'])
                                      Expanded(
                                        child: Text(
                                          aaa['name'] +
                                              ':' +
                                              aaa['count'].toString() +
                                              '  ',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.016),
                                        ),
                                      ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                      FoodBuilding.food_building[index]['progres']
                          ? GestureDetector(
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              child: Image.asset('images/build.png')),
                          onTap: () {
                            context.read(food_building_provider).buildstart(index);
                          })
                          : GestureDetector(
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              child: Image.asset('images/addperson.png')),
                          onTap: () {
                            BuilderAssignIndustryDialog(
                                context,
                                'builder' +
                                    FoodBuilding.food_building[index]['name']);
                          }),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: FoodBuilding.food_building[index]['progres']
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
                                value: FoodBuilding.food_building[index]
                                ['buildprogres'] /
                                    FoodBuilding.food_building[index]
                                    ['totalupgradereq'],
                              ),
                              Text(
                                  FoodBuilding.food_building[index]
                                  ['buildingprosses1'] +
                                      FoodBuilding.food_building[index]
                                      ['buildprogres']
                                          .toString() +
                                      '/' +
                                      FoodBuilding.food_building[index]
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
                ConfigurableExpansionTile(
                  header:Icon(Icons.keyboard_arrow_down_sharp),
                  headerExpanded: Icon(Icons.keyboard_arrow_up_sharp),
                  children: [
                    Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: Center(child: Text('data'))),
                        Text('asdfww'),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        WorkerAssignIndustryDialog(
            context, FoodBuilding.food_building[index]['name'], index);
      },
    ) :GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/' +
                            FoodBuilding.food_building[index]
                            ['imagename']),
                      ),
                    ),
                  ),
                ),
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
                          FoodBuilding.food_building[index]['name'] +
                              '('  +
                              "Qty. " +
                              FoodBuilding.food_building[index]
                              ['quantity']
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
                                    fontSize:
                                    MediaQuery.of(context).size.height *
                                        0.016),
                              ),
                              Row(
                                children: [
                                  for (Map aaa in FoodBuilding.food_building[index]['upgradereq'])
                                    Expanded(
                                      child: Text(
                                        aaa['name'] +
                                            ':' +
                                            aaa['count'].toString() +
                                            '  ',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.016),
                                      ),
                                    ),
                                ],
                              ),

                            ],
                          ),
                      ),
                    ],
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                  FoodBuilding.food_building[index]['progres']
                      ? GestureDetector(
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.07,
                          child: Image.asset('images/build.png')),
                      onTap: () {
                        context.read(food_building_provider).buildstart(index);
                      })
                      : GestureDetector(
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.07,
                          child: Image.asset('images/addperson.png')),
                      onTap: () {
                        BuilderAssignIndustryDialog(
                            context,
                            'builder' +
                                FoodBuilding.food_building[index]['name']);
                      }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: FoodBuilding.food_building[index]['progres']
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
                            value: FoodBuilding.food_building[index]
                            ['buildprogres'] /
                                FoodBuilding.food_building[index]
                                ['totalupgradereq'],
                          ),
                          Text(
                              FoodBuilding.food_building[index]
                              ['buildingprosses1'] +
                                  FoodBuilding.food_building[index]
                                  ['buildprogres']
                                      .toString() +
                                  '/' +
                                  FoodBuilding.food_building[index]
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
        WorkerAssignIndustryDialog(
            context, FoodBuilding.food_building[index]['name'], index);
      },
    );
  }
}

Future<void> WorkerAssignIndustryDialog(
    BuildContext context, String workarea, int index) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WorkerAssigningIndustry(context, workarea, index));
          }),
        );
      });
}

Future<void> BuilderAssignIndustryDialog(
    BuildContext context, String workarea) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Builder(builder: (context) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WorkerAssigningIndustryBuilder(context, workarea));
          }),
        );
      });
}

class WorkerAssigningIndustry extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigningIndustry(this.context, this.workarea, this.index);

  @override
  _WorkerAssigningIndustryState createState() =>
      _WorkerAssigningIndustryState(context, workarea, index);
}

class _WorkerAssigningIndustryState extends State<WorkerAssigningIndustry> {
  @override
  BuildContext context;
  int index;
  _WorkerAssigningIndustryState(this.context, this.workarea, this.index);
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
        padding: EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(child: Text('Assigned Worker')),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: ListView.builder(
                    itemBuilder: (_, index) {
                      return AssignedWorker(context, index);
                    },
                    itemCount: employedworker.length),
              ),
            ),
            Expanded(
                flex: 1,
                child: Center(
                    child: Text('Assign Worker (' +
                        FoodBuilding.food_building[index]['workercount']
                            .toString() +
                        "/" +
                        FoodBuilding.food_building[index]['capacity']
                            .toString() +
                        ')'))),
            Expanded(
              flex: 6,
              child: Container(
                child: ListView.builder(
                    itemBuilder: (_, index) {
                      return AssignWorker(context, index);
                    },
                    itemCount: unemployedworker.length),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                child: Center(child: Text("Done")),
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
              child: Container(
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
              child: Container(
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
          FoodBuilding.food_building.forEach((element3) {
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
    List a = FoodBuilding.food_building
        .where((element) => element['name'] == workarea_name)
        .toList();
    if (a[0]['workercount'] < a[0]['capacity']) {
      Citizen.citizen.forEach((element) {
        if (element['id'] == id) {
          setState(() {
            element['workarea'] = workarea_name;
            eleme();
            FoodBuilding.food_building.forEach((element3) {
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
    print(workarea);
    employedworker = Citizen.citizen
        .where((element) => (element['workarea'] == workarea))
        .toList();
    print(employedworker);
    unemployedworker = Citizen.citizen
        .where((element) => (element['workarea'] == 'unemployed'))
        .toList();

    loading = true;
  }
}

class WorkerAssigningIndustryBuilder extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigningIndustryBuilder(this.context, this.workarea);

  @override
  _WorkerAssigningIndustryBuilderState createState() =>
      _WorkerAssigningIndustryBuilderState(context, workarea);
}

class _WorkerAssigningIndustryBuilderState
    extends State<WorkerAssigningIndustryBuilder> {
  @override
  BuildContext context;

  _WorkerAssigningIndustryBuilderState(this.context, this.workarea);
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
        padding: EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Text('Assigned Worker')),
            Expanded(
              flex:6,
              child: ListView.builder(
                  itemBuilder: (_, index) {
                    return AssignedWorker(context, index);
                  },
                  itemCount: employedworker.length),
            ),
            Expanded(
                flex: 1,
                child: Text('Assign Worker')),
            Expanded(
              flex: 6,
              child: ListView.builder(
                  itemBuilder: (_, index) {
                    return AssignWorker(context, index);
                  },
                  itemCount: unemployedworker.length),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                child: Center(child: Text("Done")),
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
              child: Container(
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
              child: Container(
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
    print(workarea_name);
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
        .where((element) => (element['workarea'] == workarea_name))
        .toList();
    unemployedworker = Citizen.citizen
        .where((element) => (element['workarea'] == 'unemployed'))
        .toList();

    loading = true;
  }
}
