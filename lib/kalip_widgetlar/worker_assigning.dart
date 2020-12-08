
import 'package:flutter/material.dart';
import 'package:game/worker/citizen.dart';

class WorkerAssigning extends StatefulWidget {
  BuildContext context;
  String workarea;
  WorkerAssigning(this.context, this.workarea);

  @override
  _WorkerAssigningState createState() =>
      _WorkerAssigningState(context, workarea);
}

class _WorkerAssigningState extends State<WorkerAssigning> {
  @override
  BuildContext context;

  _WorkerAssigningState(this.context, this.workarea);
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
      onTap: (){this.IseAlma(unemployedworker[index]['id'],workarea);},
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
  void IseAlma(int id,String workarea_name) {
    Citizen.citizen.forEach((element) {
      if (element['id'] == id) {
        setState(() {
          element['workarea'] = workarea_name;
          eleme();
        });
      }
    });
  }
  void eleme(){
    employedworker = Citizen.citizen
        .where((element) => (element['workarea'].contains(workarea)))
        .toList();
    unemployedworker = Citizen.citizen
        .where((element) => (element['workarea'].contains('unemployed')))
        .toList();

    loading = true;

  }
}
