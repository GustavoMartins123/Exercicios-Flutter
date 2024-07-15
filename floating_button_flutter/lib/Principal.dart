import 'package:flutter/material.dart';
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
        title: Text("Floating Button",
          style: TextStyle(
            color: Colors.white
          ),),
        backgroundColor: Colors.green
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){

          },
          label: Icon(Icons.add),
          tooltip: "Botão",
          focusElevation: 50,

          // shape: BeveledRectangleBorder(
          //   borderRadius: BorderRadius.circular(21)
          // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.green,
        child: Row(
          children: [
            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.menu_book)),
            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.abc_rounded)),
          ],
        ),
      ),
    );
  }
}
