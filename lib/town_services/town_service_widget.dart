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
            0.05 *
            MediaQuery.of(context).devicePixelRatio,
        color: Colors.red,
        child: Card(
          color: Colors.grey.shade700,
          elevation: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                //height: MediaQuery.of(context).size.height * 0.16,
                //width: MediaQuery.of(context).size.width * 0.25,
                  child: Image.asset("images/woodcutter.png")),
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
                            TownServiceBuilding.town_service_building[index]
                            ['workercount']
                                .toString() +
                            "/" +
                            TownServiceBuilding.town_service_building[index]
                            ['capacity']
                                .toString() +
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
                Expanded(
                  child: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Text("Qty. " +
                        TownServiceBuilding.town_service_building[index]['quantity']
                            .toString()),
                  ),
                ),
                TownServiceBuilding.town_service_building[index]['progres']
                    ? RaisedButton(
                    child: Text('Build'),
                    onPressed: () {
                      context.read(town).buildstart(index);
                    })
                    : RaisedButton(
                    child: Text('Add Builder'),
                    onPressed: () {
                      BuilderAssignDialog(
                          context,
                          'builder' +
                              TownServiceBuilding.town_service_building[index]
                              ['name']);
                    }),
                TownServiceBuilding.town_service_building[index]['progres']
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
                    ]))
              ]),
            ],
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