import 'package:flutter/material.dart';

class CustomProductionProgressIndicator extends StatelessWidget {
  @override
  int production_progress;
  int total_production_progress;
  int lastOutput;
  int estimatedOutput;

  CustomProductionProgressIndicator(
      this.production_progress, this.total_production_progress, this.lastOutput, this.estimatedOutput);

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.70,
      child: Stack(children: [
        LinearProgressIndicator(
          minHeight: MediaQuery.of(context).size.height * 0.02,
          backgroundColor: Colors.red,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.amber,
          ),
          value: production_progress / total_production_progress,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Last output: "+ lastOutput.toString(),style: TextStyle(
    fontSize: MediaQuery.of(context).size.height * 0.016)),
            Text("Estimated output: "+ estimatedOutput.toString() ,style: TextStyle(
    fontSize: MediaQuery.of(context).size.height * 0.016)),
            Text(
                (production_progress / total_production_progress * 100).toString() +
                    '%',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.016)),
          ],
        ),
      ]),
    );
  }
}
