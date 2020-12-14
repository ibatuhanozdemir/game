import 'package:flutter/material.dart';
import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/worker/citizen.dart';

class WorkerAssigning extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigning(this.context, this.workarea,this.index);

  @override
  _WorkerAssigningState createState() =>
      _WorkerAssigningState(context, workarea,index);
}

class _WorkerAssigningState extends State<WorkerAssigning> {
  @override
  BuildContext context;
  int index;
  _WorkerAssigningState(this.context, this.workarea,this.index);
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

    return Stack(
      children: <Widget>[
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Text('Assigned Worker'),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
              itemBuilder: (_, index) {
                return AssignedWorker(context, index);
              },
              itemCount: employedworker.length),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Text('Assign Worker ('+IndustryBuilding.industry_building[index]['workercount'].toString()+"/"+IndustryBuilding.industry_building[index]['capacity'].toString()+')'),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
              itemBuilder: (_, index) {
                return AssignWorker(context, index);
              },
              itemCount: unemployedworker.length),
        ),
      ],
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
          IndustryBuilding.industry_building.forEach((element3) { element3['workercount']=Citizen.citizen
              .where((element) => (element['workarea'].contains(element3['name'])))
              .toList().length;

          });
        });
      }
    });

  }

  void IseAlma(int id, String workarea_name) {
    List a=IndustryBuilding.industry_building.where((element) => element['name'].contains(workarea_name)).toList();
    if(a[0]['workercount']<a[0]['capacity']){
      Citizen.citizen.forEach((element) {
        if (element['id'] == id) {
          setState(() {
            element['workarea'] = workarea_name;
            eleme();
            IndustryBuilding.industry_building.forEach((element3) { element3['workercount']=Citizen.citizen
                .where((element) => (element['workarea'].contains(element3['name'])))
                .toList().length;

            });
          });
        }
      });

    };



     a=[];
  }

  void eleme() {
    employedworker = Citizen.citizen
        .where((element) => (element['workarea'].contains(workarea)))
        .toList();
    unemployedworker = Citizen.citizen
        .where((element) => (element['workarea'].contains('unemployed')))
        .toList();

    loading = true;

  }

}


class WorkerAssigningBuilder extends StatefulWidget {
  BuildContext context;
  String workarea;
  int index;
  WorkerAssigningBuilder(this.context, this.workarea);

  @override
  _WorkerAssigningBuilderState createState() =>
      _WorkerAssigningBuilderState(context, workarea);
}

class _WorkerAssigningBuilderState extends State<WorkerAssigningBuilder> {
  @override
  BuildContext context;

  _WorkerAssigningBuilderState(this.context, this.workarea);
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

    return Stack(
      children: <Widget>[
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Text('Assigned Worker'),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
              itemBuilder: (_, index) {
                return AssignedWorker(context, index);
              },
              itemCount: employedworker.length),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Text('Assign Worker'),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
              itemBuilder: (_, index) {
                return AssignWorker(context, index);
              },
              itemCount: unemployedworker.length),
        ),
      ],
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
        });
      }
    });

  }

  void IseAlma(int id, String workarea_name) {


      Citizen.citizen.forEach((element) {
        if (element['id'] == id) {
          setState(() {
            element['workarea'] = workarea_name;
            eleme();

          });
        }
      });






  }

  void eleme() {
    employedworker = Citizen.citizen
        .where((element) => (element['workarea'].contains(workarea)))
        .toList();
    unemployedworker = Citizen.citizen
        .where((element) => (element['workarea'].contains('unemployed')))
        .toList();

    loading = true;

  }

}