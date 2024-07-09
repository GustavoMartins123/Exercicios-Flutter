import 'package:flutter/material.dart';
import 'dart:math' as math;
void main() {
  runApp(MaterialApp(
    home: Container(
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.blue,
            border: Border.all(
                color: Colors.yellow,
                width: 30
            )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Texto 1"),
          Text("Texto 2"),
          Text("Texto 3")
        ]
      ),
    )
  ));
}
