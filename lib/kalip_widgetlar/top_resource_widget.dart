import 'package:flutter/material.dart';

class TopResourceWidget extends StatelessWidget {
  String resourceName;
  String photoName;
  String resourceCount;
  TopResourceWidget(this.resourceName, this.photoName, this.resourceCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 2,
                blurRadius: 4)
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: Container(
              height: 15,
              child: Image.asset("images/$photoName.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text('$resourceName' +':$resourceCount'),
          ),
        ],
      ),
    );
  }
}