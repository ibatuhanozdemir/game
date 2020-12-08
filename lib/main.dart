import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:flutter/material.dart';

import 'package:game/daycircle.dart';
import 'package:game/kalip_widgetlar/worker_assigning.dart';
import 'package:game/main_interface.dart';

import 'package:game/resources.dart';
import 'package:game/resources/industry/industy_building.dart';

import 'exhibition_bottom_sheet.dart';

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
          onPressed: () async {
            dynamic result2 = await Resources().getResources();
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

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: MainInterface(greeting5.value1.toString(),greeting5.value2.toString(),greeting5.value3.toString(),greeting5.value1),
          ),
          Positioned(
            top:MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height*0.8,
            child: ListView.builder(itemBuilder:(_, index){ return IndstryBuilding(context,index);},
            itemCount: IndustryBuilding.industry_building.length),
          ),
          ExhibitionBottomSheet(),
        ],
      ),
    );
  }


  Widget IndstryBuilding (BuildContext context,int index){
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
      onTap: (){showInformationDialog(context,IndustryBuilding.industry_building[index]);},
    );

}
  Future<void> showInformationDialog(BuildContext context,String workarea) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            content: WorkerAssigning(context,workarea),
          );
        });
  }
}
