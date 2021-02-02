import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/kalip_widgetlar/production_indicator.dart';

import 'package:game/worker/citizen.dart';

import '../../main.dart';
import 'industy_buildings.dart';

class IndstryBuildingWidgeti extends ConsumerWidget {
  @override
  int index;

  IndstryBuildingWidgeti(this.index);

  Widget build(BuildContext context, ScopedReader watch) {
    watch(aa);
    return GestureDetector(
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
                            IndustryBuilding.industry_building[index]
                                ['imagename']),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.16,
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
                              IndustryBuilding.industry_building[index]
                                      ['name'] +
                                  ' ( ' +
                                  IndustryBuilding.industry_building[index]
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
                                    for (Map aaa in IndustryBuilding
                                        .industry_building[index]['upgradereq'])
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
                                IndustryBuilding.industry_building[index]
                                        ['harvest']
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child:
                                            CustomProductionProgressIndicator(
                                                IndustryBuilding
                                                        .industry_building[
                                                    index]['outputprogress'],
                                                IndustryBuilding
                                                            .industry_building[
                                                        index]
                                                    ['totaloutputprogress'],
                                                IndustryBuilding
                                                        .industry_building[
                                                    index]['lastdayoutput'],
                                                IndustryBuilding
                                                        .industry_building[
                                                    index]['estimatedoutput']),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                              "Last output: " +
                                                  IndustryBuilding
                                                      .industry_building[index]
                                                          ['lastdayoutput']
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.016),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                              "Employee: " +
                                                  IndustryBuilding
                                                      .industry_building[index]
                                                          ['workercount']
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
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
                          context: context,
                          builder: (context) {
                            return InfoAlertIndustry(
                                context,
                                IndustryBuilding.industry_building[index]['explanation']);
                          });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  IndustryBuilding.industry_building[index]['progres']
                      ? GestureDetector(
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              child: Image.asset('images/build.png')),
                          onTap: () {
                            context.read(aa).buildstart(index);
                          })
                      : GestureDetector(
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              child: Image.asset('images/addperson.png')),
                          onTap: () {
                            BuilderAssignIndustryDialog(
                                context,
                                'builder' +
                                    IndustryBuilding.industry_building[index]
                                        ['name']);
                          }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: IndustryBuilding.industry_building[index]['progres']
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
                                value: IndustryBuilding.industry_building[index]
                                        ['buildprogres'] /
                                    IndustryBuilding.industry_building[index]
                                        ['totalupgradereq'],
                              ),
                              Text(
                                  IndustryBuilding.industry_building[index]
                                          ['buildingprosses1'] +
                                      IndustryBuilding.industry_building[index]
                                              ['buildprogres']
                                          .toString() +
                                      '/' +
                                      IndustryBuilding.industry_building[index]
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
            context, IndustryBuilding.industry_building[index]['name'], index);
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
                      return AssignedWorker(context, index);
                    },
                    itemCount: employedworker.length),
              ),
            ),
            Expanded(
                flex: 1,
                child: Center(
                    child: Text('Assign Worker (' +
                        IndustryBuilding.industry_building[index]['workercount']
                            .toString() +
                        "/" +
                        IndustryBuilding.industry_building[index]['capacity']
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
        this.IstenCikarma(employedworker[index]['id']);
        context.read(aa).workAreaArranger(workarea);
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
        context.read(aa).workAreaArranger(workarea);
      },
    );
  }

  void IstenCikarma(int id) {
    Citizen.citizen.forEach((element) {
      if (element['id'] == id) {
        setState(() {
          element['workarea'] = 'unemployed';
          eleme();
          IndustryBuilding.industry_building.forEach((element3) {
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
    List a = IndustryBuilding.industry_building
        .where((element) => element['name'] == workarea_name)
        .toList();
    if (a[0]['workercount'] < a[0]['capacity']) {
      Citizen.citizen.forEach((element) {
        if (element['id'] == id) {
          setState(() {
            element['workarea'] = workarea_name;
            eleme();
            IndustryBuilding.industry_building.forEach((element3) {
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

class InfoAlertIndustry extends StatelessWidget {
  @override
  final BuildContext context;
  final String info;

  InfoAlertIndustry(this.context, this.info);

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
