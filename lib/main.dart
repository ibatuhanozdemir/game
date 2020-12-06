import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:flutter/material.dart';

import 'package:game/daycircle.dart';
import 'package:game/main_interface.dart';

import 'package:game/resources.dart';

import 'exhibition_bottom_sheet.dart';


void main() {
  runApp(ProviderScope(child: MaterialApp(title: 'river', home: MainInterface())));
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

      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage((() {
                  if (greeting5.value1 < 3) {
                    return "images/summer.jpg.jpg";
                  } else if (greeting5.value1 >= 3 && greeting5.value1 < 6) {
                    return "images/winter.jpg.jpg";
                  } else if (greeting5.value1 >= 6 && greeting5.value1 < 9) {
                    return "images/autumn.jpg.jpg";
                  } else if (greeting5.value1 >= 9 && greeting5.value1 < 12) {
                    return "images/spring.jpg.jpg";
                  }
                })()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            height: 70,
            right: 50,
            top: 20,
            child: Column(
              children: [
                Text('day=' + greeting5.value1.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                Text('mounth=' + greeting5.value2.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                Text('year=' + greeting5.value3.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                Text((() {
                  if (greeting5.value1 < 3) {
                    return 'yaz';
                  } else if (greeting5.value1 >= 3 && greeting5.value1 < 6) {
                    return 'kış';
                  } else if (greeting5.value1 >= 6 && greeting5.value1 < 9) {
                    return 'sonbahar';
                  } else if (greeting5.value1 >= 9 && greeting5.value1 < 12) {
                    return 'ilkbahar';
                  }
                })(),style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Card(child: Row(

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

    /* return  Scaffold(
        appBar: AppBar(title: Text('asdfaf',)),
      body: Center(child: Column(
        children: [
          RaisedButton(
            onPressed: (){context.read(asd).startTimer();},
          ),
          Consumer(builder: (context,  watch, child) {final greeting = watch(asd);
          return Text(greeting.value1.toString()); },)
          ,
          RaisedButton(
            onPressed: (){context.read(asd2).startTimer();},
          ),
          Consumer(builder: (context,  watch, child) {final greeting2 = watch(asd2);
          return Text(greeting2.value1.toString()); },),
          Consumer(builder: (context,  watch, child) {final greeting3 = watch(asd3);
          return Text('food='+food.food_count.toString()); },),
          Consumer(builder: (context,  watch, child) {final greeting3 = watch(asd2);
          return Text('wood='+wood.wood_count.toString()); },),
          Consumer(builder: (context,  watch, child) {final greeting5 = watch(asd3);
          return Text('day='+greeting5.value1.toString()); },),
          Consumer(builder: (context,  watch, child) {final greeting5 = watch(asd3);
          return Text('mounth='+greeting5.value2.toString()); },),
          Consumer(builder: (context,  watch, child) {final greeting5 = watch(asd3);
          return Text('year='+greeting5.value3.toString()); },),
        ],
      ),
      ),
    );*/
  }
}