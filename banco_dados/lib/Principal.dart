import 'package:banco_dados/Alterar.dart';
import 'package:banco_dados/Cadastrar.dart';
import 'package:banco_dados/Excluir.dart';
import 'package:banco_dados/Listar.dart';
import 'package:flutter/material.dart';
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List telas = [Listar(), Cadastrar(), Alterar(), Excluir()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset("images/idrparana.png",
            width: 140, height: 95),
        backgroundColor: Colors.white,
      ),
      body: telas[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.shifting,
        onTap: (int indice){
          setState(() {
            index = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "Listar",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined),
              label: "Cadastrar",
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.security_update_good),
              label: "Alterar",
              backgroundColor: Colors.purpleAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.delete_forever_outlined),
              label: "Excluir",
              backgroundColor: Colors.redAccent)
        ],
      ),
    );
  }
}
