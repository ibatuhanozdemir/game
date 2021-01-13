import 'package:flutter/material.dart';

class CustomProductionProgressIndicator extends StatelessWidget {
  @override
  int production_progress;
  int total_production_progress;

  CustomProductionProgressIndicator(
      this.production_progress, this.total_production_progress);

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.40,
      child: Stack(children: [
        LinearProgressIndicator(
          minHeight: MediaQuery.of(context).size.height * 0.02,
          backgroundColor: Colors.red,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.amber,
          ),
          value: production_progress / total_production_progress,
        ),
        Text(
            (production_progress / total_production_progress * 100).toString() +
                '%',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.016)),
      ]),
    );
  }
}
