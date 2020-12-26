import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/daycircle.dart';
import 'package:game/screens/townhall.dart';

import 'main.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2>
    with TickerProviderStateMixin {
  AnimationController animationController,
      animationController2,
      animationController3;
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
  Animation rotationAnimation, rotationAnimation2;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  double y1 = 0, y2 = 0, y3 = 0;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 0.8), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.8, end: 0.6), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.2), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 2), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2, end: 1.8), weight: 65.0),
    ]).animate(animationController);
    degFourTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 2.6), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.6, end: 2.4), weight: 85.0),
    ]).animate(animationController);
    secodlayerOneTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2.2), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.2, end: 2.0), weight: 85.0),
    ]).animate(animationController2);
    secodlayerTwoTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2.4), weight: 35.0),
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
      setState(() {
        y1 = degThreeTranslationAnimation.value * 70;
        y2 = degThreeTranslationAnimation.value * 70;
        y3 = degFourTranslationAnimation.value * 70;
      });
    });
    animationController2.addListener(() {
      setState(() {});
    });
    animationController3.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        IgnorePointer(
          child: Container(
            color: Colors.black
                .withOpacity(0), // comment or change to transparent color
            height: 500,
            width: 400,
          ),
        ),
        Positioned(
          bottom: y1,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                secodlayerFiveTranslationAnimaytion.value * 30),
            child: Transform.translate(
              offset: Offset.fromDirection(getRadiansFromDegree(270),
                  secodlayerFiveTranslationAnimaytion.value * -12),
              child: Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation2.value)),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Colors.blue,
                  width: 40,
                  height: 40,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onClick: () {
                    print('Management alttaki buton');
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: y2,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                secodlayerSixTranslationAnimaytion.value * 30),
            child: Transform.translate(
              offset: Offset.fromDirection(getRadiansFromDegree(270),
                  secodlayerSixTranslationAnimaytion.value * 12),
              child: Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation2.value)),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Colors.blue,
                  width: 40,
                  height: 40,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onClick: () {
                    print('Management ustteki buton');
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: y3,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                secodlayerOneTranslationAnimaytion.value * 30),
            child: Transform.translate(
              offset: Offset.fromDirection(getRadiansFromDegree(270),
                  secodlayerOneTranslationAnimaytion.value * 12),
              child: Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation2.value))
                  ..scale(secodlayerOneTranslationAnimaytion.value / 2),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Colors.blue,
                  width: 40,
                  height: 40,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onClick: () {
                    print('Buildings üstten 2. buton');
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: y3,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                secodlayerTwoTranslationAnimaytion.value * 30),
            child: Transform.translate(
              offset: Offset.fromDirection(getRadiansFromDegree(270),
                  secodlayerTwoTranslationAnimaytion.value * 36),
              child: Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation2.value))
                  ..scale(secodlayerTwoTranslationAnimaytion.value / 2),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Colors.blue,
                  width: 40,
                  height: 40,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onClick: () {
                    print('Buildings üstteki buton');
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: y3,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                secodlayerThreeTranslationAnimaytion.value * 30),
            child: Transform.translate(
              offset: Offset.fromDirection(getRadiansFromDegree(270),
                  secodlayerThreeTranslationAnimaytion.value * -12),
              child: Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation2.value))
                  ..scale(secodlayerThreeTranslationAnimaytion.value / 2),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Colors.blue,
                  width: 40,
                  height: 40,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onClick: () {
                    context.read(asd3).numberswitch(2);
                    print('Buildins üstten 3. buton');
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: y3,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                secodlayerFourTranslationAnimaytion.value * 30),
            child: Transform.translate(
              offset: Offset.fromDirection(getRadiansFromDegree(270),
                  secodlayerFourTranslationAnimaytion.value * -36),
              child: Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation2.value))
                  ..scale(secodlayerFourTranslationAnimaytion.value / 2),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Colors.blue,
                  width: 40,
                  height: 40,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onClick: () {
                    context.read(asd3).numberswitch(1);

                    print('Buildings en alttakı buton');
                  },
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(
              getRadiansFromDegree(270), degOneTranslationAnimation.value * 75),
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                degOneTranslationAnimation.value * 50),
            child: Transform(
              transform: Matrix4.rotationZ(
                  getRadiansFromDegree(rotationAnimation.value)),
              alignment: Alignment.center,
              child: () {
                if (animationController.isCompleted &&
                    (animationController2.value == 0) &&
                    (animationController3.value == 0)) {
                  return Material(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(20)),
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text('deneme '),
                      ));
                }
              }(),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(
              getRadiansFromDegree(270), degOneTranslationAnimation.value * 70),
          child: Transform(
            transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value)),
            alignment: Alignment.center,
            child: CircularButton(
              color: Colors.blue,
              width: 40,
              height: 40,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onClick: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp2()),
                    (route) => false);
                print('First Button');
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(
              getRadiansFromDegree(270), degOneTranslationAnimation.value * 143),
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                degOneTranslationAnimation.value * 50),
            child: Transform(
              transform: Matrix4.rotationZ(
                  getRadiansFromDegree(rotationAnimation.value)),
              alignment: Alignment.center,
              child: () {
                if (animationController.isCompleted &&
                    (animationController2.value == 0) &&
                    (animationController3.value == 0)) {
                  return Material(
                      borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(20)),
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text('Event Log '),
                      ));
                }
              }(),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(
              getRadiansFromDegree(270), degTwoTranslationAnimation.value * 70),
          child: Transform(
            transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value)),
            alignment: Alignment.center,
            child: CircularButton(
              color: Colors.black,
              width: 40,
              height: 40,
              icon: Icon(
                Icons.article_rounded,
                color: Colors.white,
              ),
              onClick: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => TownHall()),
                    (route) => false);
                print('Second button');
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(
              getRadiansFromDegree(270), degOneTranslationAnimation.value * 213),
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                degOneTranslationAnimation.value * 50),
            child: Transform(
              transform: Matrix4.rotationZ(
                  getRadiansFromDegree(rotationAnimation.value)),
              alignment: Alignment.center,
              child: () {
                if (animationController.isCompleted &&
                    (animationController2.value == 0) &&
                    (animationController3.value == 0)) {
                  return Material(
                      borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(20)),
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text('Management '),
                      ));
                }
              }(),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(270),
              degThreeTranslationAnimation.value * 70),
          child: Transform(
            transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value)),
            alignment: Alignment.center,
            child: CircularButton(
              color: Colors.orangeAccent,
              width: 40,
              height: 40,
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
          offset: Offset.fromDirection(
              getRadiansFromDegree(270), degOneTranslationAnimation.value * 285),
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                degOneTranslationAnimation.value * 50),
            child: Transform(
              transform: Matrix4.rotationZ(
                  getRadiansFromDegree(rotationAnimation.value)),
              alignment: Alignment.center,
              child: () {
                if (animationController.isCompleted &&
                    (animationController2.value == 0) &&
                    (animationController3.value == 0)) {
                  return Material(
                      borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(20)),
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text('Buildings '),
                      ));
                }
              }(),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(270),
              degFourTranslationAnimation.value * 70),
          child: Transform(
            transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value)),
            alignment: Alignment.center,
            child: CircularButton(
              color: Colors.black,
              width: 40,
              height: 40,
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
          transform:
              Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
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
    );
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
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        shape: CircleBorder(),
        onLongPress: () {
          print('asdf');
        },
        onPressed: onClick,
        child: Icon(
          icon.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
