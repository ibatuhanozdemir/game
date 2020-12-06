import 'package:flutter/material.dart';

class MainInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.99,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade500,
                    //border: Border.all(width: 3, color: Color(0xFFB78516)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, spreadRadius: 3, blurRadius: 7)
                    ]),
                child: Column(
                  children: [
                    Text(
                      "Tayfun's Town",
                      style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 25,
                          fontFamily: "Ewert"),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade300,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 2,
                                    blurRadius: 7)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 20,
                                  child: Image.asset("images/tomato.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text("Food"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade200,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 2,
                                    blurRadius: 7)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 20,
                                  child: Image.asset("images/wood.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text("Wood"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade200,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 2,
                                    blurRadius: 7)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 20,
                                  child: Image.asset("images/tomato.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text("Food"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade200,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 2,
                                    blurRadius: 7)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 20,
                                  child: Image.asset("images/wood.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text("Wood"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}
