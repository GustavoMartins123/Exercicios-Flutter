import 'package:flutter/material.dart';
import 'package:shared_flutter/Tela2.dart';
import 'package:shared_flutter/TelaCadastro.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}
class _Tela1State extends State<Tela1> {
  @override
  void initState(){
    super.initState();
    lerDados();
  }

  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  String situacao = "";

  Future<bool> loginCorreto(String usuario, String senha) async {
    final dado = await SharedPreferences.getInstance();
    String? usuarioDado = dado.getString('usuario');
    String? usuarioSenha = dado.getString('senha');
    return (usuarioDado != null && usuarioSenha != null && usuario == usuarioDado && senha == usuarioSenha);
  }
  lerDados() async {
    final dado = await SharedPreferences.getInstance();
    String usuarioDado = dado.getString('usuario') ?? "";
    String usuarioSenha = dado.getString('senha') ?? "";
    if (await loginCorreto(usuarioDado, usuarioSenha)) {
      //print("Logando automaticamente");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Tela2(usuario: usuarioDado, senha: usuarioSenha),
        ),
      );
      }
  }
  excluirDados() async{
    final dado = await SharedPreferences.getInstance();
    await dado.remove('usuario');
    await dado.remove('senha');
  }
  @override
  Widget build(BuildContext context) {
    //salvarDados();
    //lerDados();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 1 Shared Preferences")
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
                    if(await loginCorreto(campoUsuario.text, campoSenha.text)){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Tela2(
                                  usuario: campoUsuario.text,
                                  senha: campoSenha.text)));
                      setState(() {
                        situacao = "";
                      });
                    }
                    else{
                      setState(() {
                        situacao = "Usuario ou Senha inválidos";
                      });
                      return;
                    }
                  },
                child: Text("Login")),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Telacadastro()));
                },
                child: Text("Cadastrar"))
          ],
        ),
      ),
    );
  }
}
