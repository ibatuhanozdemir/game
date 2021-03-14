import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/buildings/foodbuildings/food_building_widget.dart';
import 'package:game/buildings/foodbuildings/food_buildings.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/worker/citizen.dart';

import '../main.dart';

class SecondLayerCustomAppBar2 extends StatefulWidget {
  String ilkTab;
  String ikinciTab;
  SecondLayerCustomAppBar2(this.ilkTab, this.ikinciTab);
  @override
  _SecondLayerCustomAppBar2State createState() =>
      _SecondLayerCustomAppBar2State();
}

class _SecondLayerCustomAppBar2State extends State<SecondLayerCustomAppBar2>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: AppBar(
                backgroundColor: Colors.grey,
                title: TabBar(
                  unselectedLabelColor: Colors.brown,
                  isScrollable: true,
                  indicatorColor: Colors.brown,
                  tabs: [
                    Text(widget.ilkTab),
                    Text(widget.ikinciTab),
                  ],
                ),
                centerTitle: true,
              ),
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                    IndexedWidgetBuilder: (_, index) {
                      return citizenWidgeti(index);
                    },
                    itemExtent: Citizen.citizen.length.toDouble()),
                ListView.builder(
                    IndexedWidgetBuilder: (_, index) {
                      return FoodBuildingWidgeti(index);
                    },
                    itemExtent: FoodBuilding.food_building.length.toDouble()),
              ],
            ),
          ),
        ));
  }
}

class citizenWidgeti extends StatelessWidget {
  @override
  int index;
  int heartDeger = 20;
  citizenWidgeti(this.index);

  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.grey.shade700,
        elevation: 20,
        child: Row(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.height * 0.07,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: (() {
                  if (Citizen.citizen[index]['gender'] == 'male') {
                    return Image.asset("images/male.png");
                  } else {
                    return Image.asset("images/female.png");
                  }
                })()),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              Widget: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(Citizen.citizen[index]['name']),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              Widget: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(Citizen.citizen[index]['happiness'].toString()),
              ),
            ),
            Container(
              child: Image.asset("images/heart" +
                  (() {
                    if (Citizen.citizen[index]['health'] <= 20) {
                      return "20";
                    }else if(Citizen.citizen[index]['health'] <= 40){
                      return "40";
                    }else if(Citizen.citizen[index]['health'] <= 60){
                      return "60";
                    }else if(Citizen.citizen[index]['health'] <= 80){
                      return "80";
                    }else if(Citizen.citizen[index]['health'] <= 100){
                      return "100";
                    }
                  })() +
                  ".png"),
              height: 25,
            ),
            Container(
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Text('Age'),
                  Text(Citizen.citizen[index]['age'].toString()),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showInformationDialog3(
            context,
            Citizen.citizen[index]['name'],
            Citizen.citizen[index]['workarea'],
            Citizen.citizen[index]['health'],
            Citizen.citizen[index]['happiness'],
            Citizen.citizen[index]['overallef'],
            Citizen.citizen[index]['age'],
            Citizen.citizen[index]['hunger'],
            Citizen.citizen[index]['shelter'],
        Citizen.citizen[index]['tool']['name'],
          Citizen.citizen[index]['cloth']['name']);
      },
    );
  }
}

Future<void> showInformationDialog3(
    BuildContext context,
    String name,
    String workarea,
    int health,
    int happiness,
    int overallef,
    int age,
    String hunger,
    String shelter,
    String tool,
    String cloth) async {
  return await showDialog(
      BuildContext: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Builder(builder: (context) {
                 return Container(height: MediaQuery.of(context).size.height*0.75,
                                 width: MediaQuery.of(context).size.width*0.75,
                       child: CitizenInfo(context, name, workarea,
                                      health, happiness, overallef, age, hunger,shelter,tool,cloth)
        );

        }));
      });
}

class CitizenInfo extends StatelessWidget {
  BuildContext context;

  CitizenInfo(
    this.context,
    this.name,
    this.workarea,
    this.health,
    this.happines,
    this.overallef,
    this.age,
    this.hunger,
      this.shelter,
      this.tool,
      this.cloth
  );

  String hunger;
  String name;
  String workarea,tool,cloth,shelter;
  int health, happines, overallef, age;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage("images/AppBar2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              Widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Name: " + name),
                  Text("Age: " + age.toString()),
                  Text("Workarea: " + workarea.toLowerCase()),
                  Text("Health: " + health.toString()),
                  Text("Happiness: " + happines.toString()),
                  Text("Overall Efficiency: " + overallef.toString()),
                  Text("Hunger: " + hunger),
                  Text("Shelter: " + shelter),
                  Text("Tool: " + tool),
                  Text("Cloth: " + cloth),
                ],
              ),
            ),

              Expanded(
                flex: 1,
                Widget: GestureDetector(child:Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.5,

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
}
