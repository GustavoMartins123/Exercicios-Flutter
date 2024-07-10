import 'package:flutter/material.dart';
import 'package:projetologin/TelaLogin.dart';

class TelaPrincipal extends StatefulWidget {
  final String campoLogin;
  const TelaPrincipal({Key? key, required this.campoLogin}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Center(
        child: Text("Logado como: ${widget.campoLogin}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white
        )),),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Text("Você consegiu logar"),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TelaLogin()),
                  );
                }, 
                child: Text("Ir para a tela de login"))
          ],
        ),
      ),
    );
  }
}
