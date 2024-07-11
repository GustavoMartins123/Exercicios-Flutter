import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Principal(),
    debugShowCheckedModeBanner: false,
  ));
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Detector",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              child: Image.asset("imagens/lapis.png",
                      scale: 4),
              onTap: (){
                print(("Click"));
              },
              onLongPress: (){
                print("Long");
              },
              onDoubleTap: (){
               print("Double tap");
              },
              onTapCancel: (){
                print("Cancel");
              }
            ),
            Image.asset("imagens/rocket.png",
                      scale: 4)
          ],
        ),
      ),
    );
  }
}
