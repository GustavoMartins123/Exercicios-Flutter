import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Telacadastro extends StatefulWidget {
  const Telacadastro({super.key});

  @override
  State<Telacadastro> createState() => _TelacadastroState();
}

class _TelacadastroState extends State<Telacadastro> {
  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  String situacao = "";
  salvarDados(String usuario, String senha) async{
    final dado = await SharedPreferences.getInstance();
    await dado.setString('usuario', usuario);
    await dado.setString('senha', senha);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Tela de Cadastro Shared Preferences")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: campoUsuario,
                decoration: InputDecoration(
                    labelText: "Usuario"
                )
            ),
            TextField(
                controller: campoSenha,
                decoration: InputDecoration(
                    labelText: "Senha"
                )
            ),
            Text(situacao),
            ElevatedButton(
                onPressed: () async {
                  if(campoUsuario.text.trim().isEmpty || campoSenha.text.trim().isEmpty){
                    setState(() {
                      situacao = "Nenhum campo pode ser vazio";
                    });
                    return;
                  }
                  salvarDados(campoUsuario.text, campoSenha.text);
                  Navigator.pop(context);
                },
                child: Text("Cadastrar"))
          ],
        ),
      ),
    );
  }
}
