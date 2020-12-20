import 'package:flutter/material.dart';

import '../menu.dart';

class TownHall extends StatefulWidget {
  @override
  _TownHallState createState() => _TownHallState();
}

class _TownHallState extends State<TownHall> {
List events = ['asdfaasadf','asdfsdfa','sdafasdfqwweqr','werwqrwqsdfasdf','awefasd','dsafaa','werqr','dsafasdf','sdafwqe','erwtwert','asdfaf','asdfaasadf','asdfsdfa','sdafasdfqwweqr','werwqrwqsdfasdf','awefasd','dsafaa','werqr','dsafasdf','sdafwqe','erwtwert','asdfaf'];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        floatingActionButton: MyHomePage2(),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.32,
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
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,

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
                child:Padding(
                  padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.01, 0, 0),
                  child: Column(children: [
                    TextBox(MediaQuery.of(context).size.width*0.2, MediaQuery.of(context).size.height*0.05, 'Event Log', 3, 3),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.01 ,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (_, index) {
                            return Evets(index);
                          },
                          itemCount: events.length),
                    )


                  ],),
                ),
              ),
            ),
          ],
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
            width: 2, color: Colors.amber),
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

  Widget Evets(int index){

    return Container(
      height: 30,
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
      child:
      Row(children: [

        Text("Event 1:  " +events[index])



      ],),);

  }




}
