import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/daycircle.dart';
import 'package:game/screens/townhall.dart';

import 'main.dart';
import 'navigation.dart';

class Menu2 extends StatefulWidget {
  @override
  _Menu2State createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> with TickerProviderStateMixin {
  AnimationController animationController, animationController2;

  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation,
      degFourTranslationAnimation,
      secodlayerOneTranslationAnimaytion,
      secodlayerTwoTranslationAnimaytion;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 225));
    animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 225));

    degOneTranslationAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
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
    secodlayerOneTranslationAnimaytion =
        Tween<double>(begin: 0, end: 1).animate(animationController2);
    secodlayerTwoTranslationAnimaytion = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2.4), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.4, end: 2), weight: 85.0),
    ]).animate(animationController2);

    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
    animationController2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return Positioned(
      bottom: 0,
      left: MediaQuery.of(context).size.width * 0.25,
      child: Stack(
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
            bottom: 0,
            child: Transform.translate(
              offset: Offset.fromDirection(getRadiansFromDegree(0),
                  degOneTranslationAnimation.value * 0),
              child: Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    degOneTranslationAnimation.value * 55),
                child: Button(
                    color: Color(0xffd6d6d6),
                    icon: Icons.nature,
                    text: animationController.value == 1 ? 'Natural' : '1',
                    onTap: () {
                      (context).read(nav).numberswitch(0);
                      animationController.reverse();
                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Transform.translate(
              offset: Offset.fromDirection(
                  getRadiansFromDegree(0),
                  degOneTranslationAnimation.value *
                      MediaQuery.of(context).size.width *
                      0.75 /
                      4),
              child: Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    degOneTranslationAnimation.value * 55),
                child: Button(
                    color: Color(0xffd6d6d6),
                    icon: Icons.set_meal_sharp,
                    text: animationController.value == 1 ? 'Food' : '1',
                    onTap: () {
                      (context).read(nav).numberswitch(1);
                      animationController.reverse();
                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Transform.translate(
              offset: Offset.fromDirection(
                  getRadiansFromDegree(0),
                  degOneTranslationAnimation.value *
                      MediaQuery.of(context).size.width *
                      1.5 /
                      4),
              child: Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    degOneTranslationAnimation.value * 55),
                child: Button(
                    color: Color(0xffd6d6d6),
                    icon: Icons.home_work_sharp,
                    text: animationController.value == 1 ? 'Industry' : '1',
                    onTap: () {

                      (context).read(nav).numberswitch(5);
                      animationController.reverse();


                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Transform.translate(
              offset: Offset.fromDirection(
                  getRadiansFromDegree(0),
                  degOneTranslationAnimation.value *
                      MediaQuery.of(context).size.width *
                      2.25 /
                      4),
              child: Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    degOneTranslationAnimation.value * 55),
                child: Button(
                    color: Color(0xffd6d6d6),
                    icon: Icons.storage,
                    text: animationController.value == 1 ? 'Storage' : '1',
                    onTap: () { (context).read(nav).numberswitch(6);
                    animationController.reverse();
                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width * 0.75 / 4,
            child: Transform.translate(
              offset: Offset.fromDirection(getRadiansFromDegree(0),
                  secodlayerOneTranslationAnimaytion.value * 0),
              child: Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    secodlayerOneTranslationAnimaytion.value * 55),
                child: Button(
                    color: Color(0xffd6d6d6),
                    icon: Icons.people,
                    text: animationController2.value == 1 ? 'Proficiency' : '1',
                    onTap: () {}),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width * 0.75 / 4,
            child: Transform.translate(
              offset: Offset.fromDirection(
                  getRadiansFromDegree(0),
                  secodlayerOneTranslationAnimaytion.value *
                      MediaQuery.of(context).size.width *
                      0.75 /
                      4),
              child: Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    secodlayerOneTranslationAnimaytion.value * 55),
                child: Button(
                    color: Color(0xffd6d6d6),
                    icon: Icons.people,
                    text: animationController2.value == 1 ? 'Citizen' : '1',
                    onTap: () {
                      animationController2.reverse();
                      (context).read(nav).numberswitch(2);
                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: <Widget>[
                Button(
                  color: animationController.isCompleted
                      ? Colors.blue
                      : Color(0xffd6d6d6),
                  icon: Icons.home,
                  text: 'Buildings',
                  onTap: () {
                    if (animationController.isCompleted) {
                      animationController.reverse();
                    } else {
                      animationController2.reverse();
                      animationController.forward();
                    }
                  },
                ),
                Button(
                  color: animationController2.isCompleted
                      ? Colors.blue
                      : Color(0xffd6d6d6),
                  icon: Icons.people,
                  text: 'Management',
                  onTap: () {
                    if (animationController2.isCompleted) {
                      animationController2.reverse();
                    } else {
                      animationController.reverse();
                      animationController2.forward();
                    }
                  },
                ),
                Button(
                  color: Color(0xffd6d6d6),
                  icon: Icons.emoji_events_sharp,
                  text: 'Event Log',
                  onTap: () {
                    (context).read(nav).numberswitch(3);

                    if (animationController2.isCompleted ||
                        animationController.isCompleted) {
                      animationController2.reverse();
                      animationController.reverse();
                    }
                  },
                ),
                Button(
                  color: Color(0xFFe19f28),
                  icon: Icons.people,
                  text: 'Town Service',
                  onTap: () {
                    (context).read(nav).numberswitch(4);

                    if (animationController2.isCompleted ||
                        animationController.isCompleted) {
                      animationController2.reverse();
                      animationController.reverse();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function onTap;
  final String text;
  Button({this.color, this.icon, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75 / 4,
      height: MediaQuery.of(context).size.height *0.07,
      decoration: BoxDecoration(


        image: DecorationImage(
          image: AssetImage("images/appbar.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.75 / 4 - 8,
            height: MediaQuery.of(context).size.height *0.07-8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/appbar.png"),
                fit: BoxFit.fill,
              ),
              color: color,
            ),
            child: (() {
              if (text != '1') {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon,),
                    Text(
                      text,
                      style: TextStyle(fontSize: 10,color: Color(0xFFe19f28)),
                    )
                  ],
                );
              } else {
                return Column(
                  children: [Icon(icon)],
                );
              }
            })()),
        onTap: onTap,
      ),
    );
  }
}
