import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';


const double iconStartSize = 46;
const double iconEndSize = 20;
const double iconStartMarginTop = 40;
const double iconEndMarginTop = 40;
const double iconsVerticalSpacing = 0;
const double iconsHorizontalSpacing = 30;

class ExhibitionBottomSheet extends StatefulWidget {
  @override
  _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double get minHeight => MediaQuery.of(context).size.height *0.07;
  double get maxHeight => MediaQuery.of(context).size.height * 0.745;

  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top);

  double get headerFontSize => lerp(14, 18);

  double get itemBorderRadius => lerp(8, 24);

  double get iconLeftBorderRadius => itemBorderRadius;

  double get iconRightBorderRadius => lerp(8, 0);

  double get iconSize => lerp(iconStartSize, iconEndSize);

  double iconTopMargin(int index) =>
      lerp(iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize)) +
      headerTopMargin;

  double iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);
  int y=0;
  int z=0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              height: lerp(minHeight, maxHeight),
              width: lerp(MediaQuery.of(context).size.width * 0.25,
                  MediaQuery.of(context).size.width),
              left: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _toggle,
                onVerticalDragUpdate: _handleDragUpdate,
                onVerticalDragEnd: _handleDragEnd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: Opacity(
                    opacity: _controller.isCompleted ? 1 : 0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              SheetHeader(
                                fontSize: headerFontSize,
                                topMargin: 20,
                                text: 'Food',
                              ),
                              for (Map aaab in FoodResources.food_resource_sublist)
                                _foodResources(aaab['foodname'],FoodResources.food_resource_sublist.indexOf(aaab)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              SheetHeader(
                                text: 'Industry',
                                fontSize: headerFontSize,
                                topMargin: 20,
                              ),
                              for (String aaa
                                  in IndustryResources.industry_resources_name)
                                _industryResources(aaa),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
                child: _controller.isCompleted
                    ? Positioned(
                        height: MediaQuery.of(context).size.width * 0.01,
                        width: MediaQuery.of(context).size.width * 0.01,
                        right: 0,
                        bottom: 0,
                        child: Text(
                          '.',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Positioned(
                        height: MediaQuery.of(context).size.width * 0.07,
                        width: MediaQuery.of(context).size.width * 0.222,
                        left: 18,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            _toggle();
                          },
                          child: Text(
                            'Resources',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
          ],
        );
      },
    );
  }

  Widget _foodResources(String event,int index) {


    return Positioned(
      height: 50,
      width: 180,
      top: 50 + index.toDouble() * 20,
      left: 0,
      child: ClipRRect(
        child: Text(
            event + " = " + "" +FoodResources.food_resource_sublist[index]['count'].toString(),
            style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _industryResources(String event) {
    int index = IndustryResources.industry_resources_name.indexOf(event);

    return Positioned(
      height: 50,
      width: 180,
      top: 50 + index.toDouble() * 20,
      left: 0,
      child: ClipRRect(
        child: Text(
            event +
                " = " +
                "" +
                IndustryResources.industry_resources[index][event].toString(),
            style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;

    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= (details.primaryDelta) / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;
  final String text;
  const SheetHeader(
      {Key key,
      @required this.fontSize,
      @required this.topMargin,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
