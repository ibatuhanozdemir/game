import 'package:flutter/material.dart';


class TimeWidget extends StatelessWidget {
  TimeWidget(this.day, this.month, this.year, this.season);
  String day;
  String month;
  String year;
  int season;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          day+"/"+month+"/"+year,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        Row(
          children: [
            Container(
              height: 20,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Image.asset((() {
                  if (season <= 3) {
                    return 'images/winter.png';
                  } else if (season > 3 && season <= 6) {
                    return 'images/spring.png';
                  } else if (season > 6 && season <= 9) {
                    return 'images/summer.png';
                  } else if (season > 9 && season <= 12) {
                    return 'images/autumn.png';
                  }
                })()),
              ),
            ),
            Text(
            (() {
              if (season <= 3) {
                return 'Winter';
              } else if (season > 3 && season <= 6) {
                return 'Spring';
              } else if (season > 6 && season <= 9) {
                return 'Summer';
              } else if (season > 9 && season <= 12) {
                return 'Autumn';
              }
            })(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),]
        ),
      ],
    );
  }
}
