import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/kalip_widgetlar/production_indicator.dart';

import 'package:game/worker/citizen.dart';

import '../../main.dart';
import 'food_buildings.dart';

class FoodBuildingWidgeti extends ConsumerWidget {
  @override
  int index;

  FoodBuildingWidgeti(this.index);

  Widget build(BuildContext context, ScopedReader watch) {
    watch(food_building_provider);

    return FoodBuilding.food_building[index]['harvest']
        ? GestureDetector(
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
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.width * 0.20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/' +
                                      FoodBuilding.food_building[index]
                                          ['imagename']),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
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
                                        FoodBuilding.food_building[index]
                                                ['name'] +
                                            '( ' +
                                            FoodBuilding.food_building[index]
                                                    ['quantity']
                                                .toString() +
                                            ' )',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Alike",
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 7,
                                    thickness: 1,
                                    indent: 50,
                                    endIndent: 50,
                                    color: Colors.black54,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Requirements:',
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.016),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    for (Map aaa in FoodBuilding
                                                            .food_building[
                                                        index]['upgradereq'])
                                                      Expanded(
                                                        child: Text(
                                                          aaa['name'] +
                                                              ':' +
                                                              aaa['count']
                                                                  .toString() +
                                                              '  ',
                                                          style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
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
                                          Center(
                                            child: Text(
                                              "Employee: " +
                                                  FoodBuilding
                                                      .food_building[index]
                                                          ['workercount']
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.016),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.07,
                                    child: Image.asset('images/info.png'),
                                  ),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return InfoAlertFood(
                                              context,
                                              FoodBuilding.food_building[index]
                                                  ['explanation']);
                                        });
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                FoodBuilding.food_building[index]['progres']
                                    ? GestureDetector(
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            child: Image.asset(
                                                'images/build.png')),
                                        onTap: () {
                                          context
                                              .read(food_building_provider)
                                              .buildstart(index);
                                        })
                                    : GestureDetector(
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            child: Image.asset(
                                                'images/addperson.png')),
                                        onTap: () {
                                          BuilderAssignFoodDialog(
                                              context,
                                              'builder' +
                                                  FoodBuilding
                                                          .food_building[index]
                                                      ['name']);
                                        }),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: FoodBuilding.food_building[index]
                                          ['progres']
                                      ? Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.20,
                                        )
                                      : Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.20,
                                          child: Stack(children: [
                                            LinearProgressIndicator(
                                              minHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              backgroundColor: Colors.red,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Colors.amber,
                                              ),
                                              value: FoodBuilding
                                                          .food_building[index]
                                                      ['buildprogres'] /
                                                  FoodBuilding
                                                          .food_building[index]
                                                      ['totalupgradereq'],
                                            ),
                                            Text(
                                                FoodBuilding.food_building[
                                                            index]
                                                        ['buildingprosses1'] +
                                                    FoodBuilding
                                                        .food_building[index]
                                                            ['buildprogres']
                                                        .toString() +
                                                    '/' +
                                                    FoodBuilding
                                                        .food_building[index]
                                                            ['totalupgradereq']
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.016)),
                                          ])),
                                )
                              ]),
                        ],
                      ),
                      Container(
                        child: ConfigurableExpansionTile(
                          header: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color(0xFFe19f28),
                          ),
                          headerExpanded: Icon(
                            Icons.keyboard_arrow_up_sharp,
                            color: Color(0xFFe19f28),
                          ),
                          children: [
                            Column(
                              children: [
                                for (Map aaa in FoodBuilding
                                    .food_building[index]['workeroutput'])
                                  FoodField(
                                      aaa['imagename'],
                                      aaa['outputprogress'],
                                      aaa['totaloutputprogress'],
                                      aaa['lastdayoutput'],
                                      aaa['estimatedoutput'],
                                      aaa['workercount'],
                                      FoodBuilding.food_building[index]['name'],
                                      aaa['name'])
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              WorkerAssignFoodDialog(
                  context, FoodBuilding.food_building[index]['name'], index);
            },
          )
        : GestureDetector(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
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
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/' +
                                  FoodBuilding.food_building[index]
                                      ['imagename']),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
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
                                    FoodBuilding.food_building[index]['name'] +
                                        '( ' +
                                        FoodBuilding.food_building[index]
                                                ['quantity']
                                            .toString() +
                                        ' )',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Alike",
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 7,
                                thickness: 1,
                                indent: 50,
                                endIndent: 50,
                                color: Colors.black54,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Requirements:',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.016),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                for (Map aaa in FoodBuilding
                                                        .food_building[index]
                                                    ['upgradereq'])
                                                  Expanded(
                                                    child: Text(
                                                      aaa['name'] +
                                                          ':' +
                                                          aaa['count']
                                                              .toString() +
                                                          '  ',
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Last Output: " +
                                                FoodBuilding
                                                    .food_building[index]
                                                        ['lastdayoutput']
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.016),
                                          ),
                                          Text(
                                            "Employee: " +
                                                FoodBuilding
                                                    .food_building[index]
                                                        ['workercount']
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.016),
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.07,
                                child: Image.asset('images/info.png'),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return InfoAlertFood(
                                          context,
                                          FoodBuilding.food_building[index]
                                              ['explanation']);
                                    });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            FoodBuilding.food_building[index]['progres']
                                ? GestureDetector(
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                        child: Image.asset('images/build.png')),
                                    onTap: () {
                                      context
                                          .read(food_building_provider)
                                          .buildstart(index);
                                    })
                                : GestureDetector(
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                        child: Image.asset(
                                            'images/addperson.png')),
                                    onTap: () {
                                      BuilderAssignFoodDialog(
                                          context,
                                          'builder' +
                                              FoodBuilding.food_building[index]
                                                  ['name']);
                                    }),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: FoodBuilding.food_building[index]
                                      ['progres']
                                  ? Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.20,
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.20,
                                      child: Stack(children: [
                                        LinearProgressIndicator(
                                          minHeight: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          backgroundColor: Colors.red,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Colors.amber,
                                          ),
                                          value: FoodBuilding
                                                      .food_building[index]
                                                  ['buildprogres'] /
                                              FoodBuilding.food_building[index]
                                                  ['totalupgradereq'],
                                        ),
                                        Text(
                                            FoodBuilding.food_building[index]
                                                    ['buildingprosses1'] +
                                                FoodBuilding
                                                    .food_building[index]
                                                        ['buildprogres']
                                                    .toString() +
                                                '/' +
                                                FoodBuilding
                                                    .food_building[index]
                                                        ['totalupgradereq']
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
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
              WorkerAssignFoodDialog(
                  context, FoodBuilding.food_building[index]['name'], index);
            },
          );
  }
}

class FoodField extends ConsumerWidget {
  String image, food_building_name, field_name;
  int production_progress;
  int total_production_progress;
  int lastOutput;
  int estimatedOutput;
  int workercount;

  FoodField(
      this.image,
      this.production_progress,
      this.total_production_progress,
      this.lastOutput,
      this.estimatedOutput,
      this.workercount,
      this.food_building_name,
      this.field_name);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(food_building_provider);
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/' + image),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(field_name.toUpperCase(),style: TextStyle(color: Color(0xFFe19f28)),),
              Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: CustomProductionProgressIndicator(production_progress,
                      total_production_progress, lastOutput, estimatedOutput)),
            ],
          ),
          GestureDetector(
            child: Icon(
              Icons.remove,
              size: 20,
            ),
            onTap: () {
              context
                  .read(food_building_provider)
                  .farmfieldWorkerRemove(food_building_name, field_name);
            },
          ),
          Text(workercount.toString()),
          GestureDetector(
            child: Icon(Icons.add, size: 20),
            onTap: () {
              context
                  .read(food_building_provider)
                  .farmfieldWorkerAdd(food_building_name, field_name);
            },
          ),
        ],
      ),
    );
  }
}

Future<void> WorkerAssignFoodDialog(
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
                child: WorkerAssigningFood(context, workarea, index));
          }),
        );
      });
}

Future<void> BuilderAssignFoodDialog(
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
                child: WorkerAssigningFoodBuilder(context, workarea));
          }),
        );
      });
}

class WorkerAssigningFood extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigningFood(this.context, this.workarea, this.index);

  @override
  _WorkerAssigningFoodState createState() =>
      _WorkerAssigningFoodState(context, workarea, index);
}

class _WorkerAssigningFoodState extends State<WorkerAssigningFood> {
  @override
  BuildContext context;
  int index;
  _WorkerAssigningFoodState(this.context, this.workarea, this.index);
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
              child: Center(child: Text('Assigned Worker')),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: ListView.builder(
                    itemBuilder: (_, index) {
                      return AssignedWorker(
                          context,
                          index,
                          employedworker[index]['workarea'],
                          employedworker[index]['workfield']);
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
                      return AssignWorker(
                          context, index, unemployedworker[index]['workarea']);
                    },
                    itemCount: unemployedworker.length),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(child:Padding(
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

  Widget AssignedWorker(BuildContext context, int index,
      String food_building_name, String field_name) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(employedworker[index]['name']),
                ),
              ),
              (() {
                if (employedworker[index]['workarea'] == 'FARM FIELD' ||
                    employedworker[index]['workarea'] == 'ORCHARD') {
                  return Container(
                    padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.height * 0.05,
                    child: Text(employedworker[index]['workfield']),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.height * 0.05,
                    child: Text(""),
                  );
                }
              }()),
            ],
          ),
        ),
      ),
      onTap: () {
        this.IstenCikarma(employedworker[index]['id']);
        context
            .read(food_building_provider)
            .workAreaArranger(food_building_name);
        context
            .read(food_building_provider)
            .workFieldArranger(food_building_name, field_name);
      },
    );
  }

  Widget AssignWorker(
      BuildContext context, int index, String food_building_name) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(unemployedworker[index]['name']),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        this.IseAlma(unemployedworker[index]['id'], workarea);
        context
            .read(food_building_provider)
            .workAreaArranger(food_building_name);
      },
    );
  }

  void IstenCikarma(int id) {
    Citizen.citizen.forEach((element) {
      if (element['id'] == id) {
        setState(() {
          element['workarea'] = 'unemployed';
          element['workfield'] = 'unemployed';
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
    employedworker = Citizen.citizen.where((element2) => element2['age']>=calisma_yasi).toList()
        .where((element) => (element['workarea'] == workarea))
        .toList();
    unemployedworker = Citizen.citizen.where((element2) => element2['age']>=calisma_yasi).toList()
        .where((element) => (element['workarea'] == 'unemployed'))
        .toList();
    loading = true;
  }
}

class WorkerAssigningFoodBuilder extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigningFoodBuilder(this.context, this.workarea);

  @override
  _WorkerAssigningFoodBuilderState createState() =>
      _WorkerAssigningFoodBuilderState(context, workarea);
}

class _WorkerAssigningFoodBuilderState
    extends State<WorkerAssigningFoodBuilder> {
  @override
  BuildContext context;

  _WorkerAssigningFoodBuilderState(this.context, this.workarea);
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
            Expanded(flex: 1, child: Text('Assigned Worker')),
            Expanded(
              flex: 6,
              child: ListView.builder(
                  itemBuilder: (_, index) {
                    return AssignedWorker(context, index);
                  },
                  itemCount: employedworker.length),
            ),
            Expanded(flex: 1, child: Text('Assign Worker')),
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
              child: GestureDetector(child:Padding(
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

class InfoAlertFood extends StatelessWidget {
  @override
  final BuildContext context;
  final String info;
  InfoAlertFood(this.context, this.info);
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.brown.shade400,
      content: Container(
        color: Colors.transparent,
        child: Text(info),
      ),
    );
  }
}
