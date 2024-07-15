import 'package:flutter/material.dart';
import 'package:youtube/Biblioteca.dart';
import 'package:youtube/EmAlta.dart';
import 'package:youtube/Inicio.dart';
import 'package:youtube/Inscricoes.dart';
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List telas = [Inicio(), EmAlta(), Inscricoes(), Biblioteca()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("imagens/youtube.png",
                width: 100,
                height: 100,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.account_circle)),
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.videocam))
        ],
        //centerTitle: false,
      ),
      body: telas[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indice){
          setState(() {
            index = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Inicio",
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              label: "Em alta",
              backgroundColor: Colors.deepOrange),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Incrições",
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.folder_copy),
              label: "Biblioteca",
    backgroundColor: Colors.lightBlue),
        ],
      ),
    );
  }
}
