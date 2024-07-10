import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController campoTexto = TextEditingController();
  TextEditingController campoTexto2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo Texto",
               style: TextStyle(
                 color: Colors.white
               ),),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: campoTexto,
                keyboardType: TextInputType.number,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                decoration: InputDecoration(
                  labelText: "Digite um valor",
                  fillColor: Colors.yellow,
                  filled: true
                ),
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 25
                ),
                /*obscureText: true,
                obscuringCharacter: "#",*/
              /*onTap: (){
                  print("Campo clicado");
                },
                onSubmitted: (String campo){
                  print(campo);
                },*/
                // onChanged: (String campo){
                //   print(campo);
                // },
              ),
          ),
          Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                  controller: campoTexto2,
                  maxLength: 400,
                  decoration: InputDecoration(
                      labelText: "Digite uma descrição"
                  ),
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 25
                  ),),),
          ElevatedButton(
              onPressed: (){
                if(campoTexto.text.trim().isEmpty || campoTexto2.text.trim().isEmpty){
                  print("Algum campo vazio");
                  return;
                }
                print("Texto 1: ${campoTexto.text}\nTexto 2: ${campoTexto2.text}");
              },
              child: Text("Salvar"))
        ],
      ),
    );
  }
}
