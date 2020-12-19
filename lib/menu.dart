import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  AnimationController animationController, animationController2,animationController3;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation,
      degFourTranslationAnimation,
      secodlayerOneTranslationAnimaytion,
      secodlayerTwoTranslationAnimaytion,
      secodlayerThreeTranslationAnimaytion,
      secodlayerFourTranslationAnimaytion,
      secodlayerFiveTranslationAnimaytion,
      secodlayerSixTranslationAnimaytion;
  Animation rotationAnimation,rotationAnimation2;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    animationController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    animationController3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    degFourTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.95), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.95, end: 1.0), weight: 85.0),
    ]).animate(animationController);
    secodlayerOneTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2.2), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.2, end: 2.0), weight: 85.0),
    ]).animate(animationController2);
    secodlayerTwoTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin:0, end: 2.4), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.4, end: 2), weight: 85.0),
    ]).animate(animationController2);
    secodlayerThreeTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.75, end: 2), weight: 85.0),
    ]).animate(animationController2);
    secodlayerFourTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2.95), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.95, end: 2.0), weight: 85.0),
    ]).animate(animationController2);
    secodlayerFiveTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2.95), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.95, end: 2.0), weight: 85.0),
    ]).animate(animationController3);
    secodlayerSixTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2.95), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.95, end: 2.0), weight: 85.0),
    ]).animate(animationController3);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    rotationAnimation2 = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
    animationController2.addListener(() {setState(() {

    });});
    animationController3.addListener(() {setState(() {

    });});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  right: 30,
                  bottom: 30,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      IgnorePointer(
                        child: Container(
                          color: Colors.black.withOpacity(
                              0.5), // comment or change to transparent color
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(240),
                            secodlayerFiveTranslationAnimaytion.value * 60),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation2.value))
                            ..scale(secodlayerFiveTranslationAnimaytion.value/2),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(210),
                            secodlayerSixTranslationAnimaytion.value * 60),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation2.value))
                            ..scale(secodlayerSixTranslationAnimaytion.value/2),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(270),
                            secodlayerOneTranslationAnimaytion.value * 60),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation2.value))
                            ..scale(secodlayerOneTranslationAnimaytion.value/2),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(240),
                            secodlayerTwoTranslationAnimaytion.value * 60),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation2.value))
                            ..scale(secodlayerTwoTranslationAnimaytion.value/2),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(210),
                            secodlayerThreeTranslationAnimaytion.value * 60),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation2.value))
                            ..scale(secodlayerThreeTranslationAnimaytion.value/2),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),
                            secodlayerFourTranslationAnimaytion.value * 60),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation2.value))
                            ..scale(secodlayerFourTranslationAnimaytion.value/2),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(270),
                            degOneTranslationAnimation.value * 70),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(240),
                            degTwoTranslationAnimation.value * 70),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degTwoTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.black,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('Second button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(210),
                            degThreeTranslationAnimation.value * 70),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degThreeTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.orangeAccent,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onClick: () {
                              if (animationController3.isCompleted) {
                                animationController3.reverse();
                              } else {
                                animationController2.reverse();
                                animationController3.forward();
                              }
                              print('Third Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),
                            degFourTranslationAnimation.value * 70),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degFourTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.black,
                            width: 35,
                            height: 35,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onClick: () {
                              if (animationController2.isCompleted) {
                                animationController2.reverse();
                              } else {
                                animationController3.reverse();
                                animationController2.forward();
                              }
                              print('Fourth Button');
                            },
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value)),
                        alignment: Alignment.center,
                        child: CircularButton(
                          color: Colors.red,
                          width: 40,
                          height: 40,
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onClick: () {
                            if (animationController.isCompleted) {
                              animationController.reverse();
                              animationController2.reverse();
                              animationController3.reverse();
                            } else {
                              animationController.forward();
                            }
                          },
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon,iconSize: 20, enableFeedback: true, onPressed: onClick),
    );
  }
}
