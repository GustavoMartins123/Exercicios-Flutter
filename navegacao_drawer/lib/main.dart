import 'package:flutter/material.dart';
import 'package:navegacao_drawer/Pagina1.dart';
import 'package:navegacao_drawer/Pagina2.dart';
import 'package:navegacao_drawer/Pagina3.dart';

void main() {
  runApp(MaterialApp(
    home: Principal(),
  ));
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int indice = 0;
  List telas = [Pagina1(), Pagina2(), Pagina3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navegação")
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
            child: Text("Drawer Header",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),),),
            ListTile(
              title: Text("Pagina1"),
              leading: Icon(Icons.picture_as_pdf),
              onTap: (){
                setState(() {
                  indice = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
                title: Text("Pagina2"),
                leading: Icon(Icons.read_more),
                onTap: (){
                  setState(() {
                    indice = 1;
                  });
                  Navigator.pop(context);
                },
            ),
            ListTile(
                title: Text("Pagina3"),
                leading: Icon(Icons.safety_divider),
                onTap: (){
                  setState(() {
                    indice = 2;
                  });
                  Navigator.pop(context);
                },
            )
          ],
        ),
      ),
      body: telas[indice],
    );
  }
}
