import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:flutter/material.dart';

import 'package:game/daycircle.dart';
import 'package:game/main_interface.dart';

import 'package:game/resources.dart';

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
          Padding(
            padding: EdgeInsets.fromLTRB(0, 210, 0, 0),
            child: Card(
              color: Colors.grey.shade700,
              elevation: 20,
              child: Row(
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: MediaQuery.of(context).size.height * 0.16,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Image.asset("images/woodcutter.png")),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text("woodcutter"),
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
          ),
          ExhibitionBottomSheet(),
        ],
      ),
    );
  }
}
