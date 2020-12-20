import 'package:flutter/material.dart';

class TownHall extends StatefulWidget {
  @override
  _TownHallState createState() => _TownHallState();
}

class _TownHallState extends State<TownHall> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
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
            padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.01, 0, 0),
            child: Column(
              children: [
                TextBox(MediaQuery.of(context).size.width*0.2, MediaQuery.of(context).size.height*0.05, 'OverView', 3, 3),

                Row(children: [
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Year', -3, -3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6 , MediaQuery.of(context).size.height*0.05, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Season', -3, 3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05,'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, 5, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Year', -3, -3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Season', -3, 3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),],),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Year', -3, -3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Season', -3, 3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, 5, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Year', -3, -3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Season', -3, 3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),],),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Year', -3, -3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Season', -3, 3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05,'Summer', 3, 3),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, 5, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Year', -3, -3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, '1', 3, -3),

                            ],
                          ),
                          Row(
                            children: [
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Season', -3, 3),
                              TextBox(MediaQuery.of(context).size.width*0.84/6, MediaQuery.of(context).size.height*0.05, 'Summer', 3, 3),

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


    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Center(child: Text(text,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),)),
    );



  }
}
