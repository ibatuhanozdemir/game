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
                    itemBuilder: (_, index) {
                      return citizenWidgeti(index);
                    },
                    itemCount: Citizen.citizen.length),
                ListView.builder(
                    itemBuilder: (_, index) {
                      return FoodBuildingWidgeti(index);
                    },
                    itemCount: FoodBuilding.food_building.length),
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
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(Citizen.citizen[index]['name']),
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
            Citizen.citizen[index]['gender'],
            Citizen.citizen[index]['tool'],
            Citizen.citizen[index]['cloth'],
            Citizen.citizen[index]['education'],
            Citizen.citizen[index]['health'],
            Citizen.citizen[index]['happiness'],
            Citizen.citizen[index]['overallef'],
            Citizen.citizen[index]['age'],
            Citizen.citizen[index]['hunger']);
      },
    );
  }
}

Future<void> showInformationDialog3(
    BuildContext context,
    String name,
    String workarea,
    String gender,
    String tool,
    String cloth,
    String education,
    int health,
    int happiness,
    int overallef,
    int age,
    String hunger) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: CitizenInfo(context, name, workarea, gender, tool, cloth,
              education, health, happiness, overallef, age, hunger),
          actions: [
            GestureDetector(
              child: Center(child: Text("Done")),
              onTap: () {
                Navigator.pop;
              },
            )
          ],
        );
      });
}

class CitizenInfo extends StatelessWidget {
  BuildContext context;

  CitizenInfo(
    this.context,
    this.name,
    this.workarea,
    this.gender,
    this.tool,
    this.cloth,
    this.education,
    this.health,
    this.happines,
    this.overallef,
    this.age,
    this.hunger,
  );

  String hunger;
  String name;
  String workarea;
  String gender, tool, cloth, education;
  int health, happines, overallef, age;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: (() {
                if (gender == 'male') {
                  return Image.asset("images/maleface.jpg");
                } else {
                  return Image.asset("images/femaleface.jpg");
                }
              })(),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Name:" + name),
            Text("Age" + age.toString()),
            Text("Gender:" + gender),
            Text("Workarea:" + workarea),
            Text("Health" + health.toString()),
            Text("Happiness" + happines.toString()),
            Text("Overall Efficiency:" + overallef.toString()),
            Text("Tool:" + tool),
            Text("Cloth" + cloth),
            Text("Education" + education),
            Text("Hunger" + hunger),
          ],
        ),
      ),
    );
  }
}
