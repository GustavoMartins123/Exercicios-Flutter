import 'package:flutter/material.dart';
class Tela2 extends StatefulWidget {
  final String usuario;
  final String senha;
  const Tela2({Key? key,required this.usuario, required this.senha}) : super(key: key);

  @override
  State<Tela2> createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Tela 2 Shared Preferences")
      ),
      body: Container(
        child: Column(
          children: [
            Text("Bem vindo: ${widget.usuario}"),
            Text("Sua senha: ${widget.senha}")
          ],
        ),
      ),
    );
  }
}
