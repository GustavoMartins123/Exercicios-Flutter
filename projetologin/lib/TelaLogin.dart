import 'package:flutter/material.dart';
import 'package:projetologin/TelaPrincipal.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController campoLogin = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  bool senha = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Tela de Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ))),
        backgroundColor: Colors.green
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: campoLogin,
              style: TextStyle(
                fontSize: 16
              ),
              decoration: InputDecoration(
                labelText: "Digite o login"
              ),
            ),
            TextField(
              controller: campoSenha,
              style: TextStyle(
                  fontSize: 16
              ),
              obscureText: senha,
              decoration: InputDecoration(
                  labelText: "Digite a senha"
              ),
                onTap: (){
                  setState(() {
                    senha = !senha;
                  });
                },
            ),
            ElevatedButton(
                onPressed: (){
                  if(VerificarLoginSenha(campoLogin.text, campoSenha.text)){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TelaPrincipal(
                        campoLogin:  campoLogin.text
                      )),
                    );
                    return;
                  }
                  campoLogin.text = "";
                  campoSenha.text = "";
                  print("Login ou Senha incorretos");
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
bool VerificarLoginSenha(String login, String senha){
  if(login == "usuario" && senha == "1234"){
    return true;
  }
  return false;
}