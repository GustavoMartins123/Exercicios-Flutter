import 'dart:math';

import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: const Text("Frase Única",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none
              )
      )
    );
  }
}
