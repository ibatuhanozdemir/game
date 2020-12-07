import 'package:flutter/material.dart';


class TimeWidget extends StatelessWidget {
  TimeWidget(this.day, this.month, this.year, this.season);
  String day;
  String month;
  String year;
  int season;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'day=' + day,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'month=' + month,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'year=' + year,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          (() {
            if (season < 3) {
              return 'yaz';
            } else if (season >= 3 && season < 6) {
              return 'kış';
            } else if (season >= 6 && season < 9) {
              return 'sonbahar';
            } else if (season >= 9 && season < 12) {
              return 'ilkbahar';
            }
          })(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
