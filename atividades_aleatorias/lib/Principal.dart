import 'dart:math';

import 'package:flutter/material.dart';
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController campoTexto = TextEditingController();
  List frases = ["Correr", "Comer", "Descansar", "Ler", "Se Divertir", "Sair"];
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atividades aleatórias",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 50, 153, 204)
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(frases[indice]),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    indice = Random().nextInt(frases.length);
                  });
                },
                child: Text("Clique aqui"))
          ],
        ),
      ),
    );
  }
}
