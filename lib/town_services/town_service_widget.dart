import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/main.dart';
import 'package:game/town_services/town_service_building.dart';

class TownServiceWidget extends ConsumerWidget {
  @override
  int index;

  TownServiceWidget(this.index);

  Widget build(BuildContext context, ScopedReader watch) {
    watch(town);

    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height *
            0.15,


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
                          image: AssetImage('images/'+TownServiceBuilding.town_service_building[index]['imagename']),
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
                          TownServiceBuilding.town_service_building[index]['name'] +
                              '(' +
                              "Qty. " +
                                  TownServiceBuilding.town_service_building[index]['quantity']
                                      .toString()+
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
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.016),
                              ),
                              Row(
                                children: [

                                  for (Map aaa in TownServiceBuilding.town_service_building[index]['upgradereq'])
                                    Expanded(
                                      child: Text(
                                        aaa['name'] +
                                            ':' +
                                            aaa['count'].toString() +
                                            '  ',
                                        style: TextStyle(
                                            fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                  TownServiceBuilding.town_service_building[index]['progres']
                      ? GestureDetector(
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.07,
                          child: Image.asset('images/build.png')),
                      onTap: () {
                        context.read(town).buildstart(index);
                      })
                      : GestureDetector(
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.07,
                          child: Image.asset('images/addperson.png')),
                      onTap: () {
                        BuilderAssignDialog(
                            context,
                            'builder' +
                                TownServiceBuilding.town_service_building[index]
                                ['name']);
                      }),



                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: TownServiceBuilding.town_service_building[index]['progres']
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
                            value: TownServiceBuilding.town_service_building[index]
                            ['buildprogres'] /
                                TownServiceBuilding.town_service_building[index]['totalupgradereq'],
                          ),
                          Text(TownServiceBuilding.town_service_building[index]['buildingprosses1']+TownServiceBuilding.town_service_building[index]
                          ['buildprogres'].toString()+'/'+
                              TownServiceBuilding.town_service_building[index]['totalupgradereq'].toString(),style: TextStyle(
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
        WorkerAssignDialog(
            context, TownServiceBuilding.town_service_building[index]['name'], index);
      },
    );
  }
}