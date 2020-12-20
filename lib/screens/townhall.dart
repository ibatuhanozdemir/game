import 'package:flutter/material.dart';

class TownHall extends StatefulWidget {
  @override
  _TownHallState createState() => _TownHallState();
}

class _TownHallState extends State<TownHall> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.4,
          decoration: BoxDecoration(
            color: Colors.brown,
            border: Border.all(
                width: 1.0, color: const Color(0x2e707070)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xb8000000),
                offset: Offset(5, 5),
                blurRadius: 6,
              ),
            ],
          ),

          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: [
                TextBox(80, 30, 'OverView', 3, 3),

                Row(children: [
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(60, 29, 'Year', -3, -3),
                              TextBox(60 , 29, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(60, 29, 'Season', -3, 3),
                              TextBox(60, 29, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(60, 29, 'Year', -3, -3),
                              TextBox(60 , 29, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(60, 29, 'Season', -3, 3),
                              TextBox(60, 29, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),],),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(60, 29, 'Year', -3, -3),
                              TextBox(60 , 29, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(60, 29, 'Season', -3, 3),
                              TextBox(60, 29, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(60, 29, 'Year', -3, -3),
                              TextBox(60 , 29, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(60, 29, 'Season', -3, 3),
                              TextBox(60, 29, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),],),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(60, 29, 'Year', -3, -3),
                              TextBox(60 , 29, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(60, 29, 'Season', -3, 3),
                              TextBox(60, 29, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(60, 29, 'Year', -3, -3),
                              TextBox(60 , 29, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(60, 29, 'Season', -3, 3),
                              TextBox(60, 29, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),],)
                ],)


              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget TextBox(double width,double height,String text,double shadowx,double shadowy){


    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          border: Border.all(
              width: 1.0, color: const Color(0x2e707070)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xb8000000),
              offset: Offset(shadowx, shadowy),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(child: FittedBox(fit:BoxFit.fitWidth,child: Text(text))),
      ),
    );



  }
}
