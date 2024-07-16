import 'package:flutter/material.dart';
import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  Banco banco = Banco();
  TextEditingController nomeController = TextEditingController();
  TextEditingController marcaController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController validadeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: "Nome do Produto",
                hintText: "Digite o Nome"
              ),
              style: TextStyle(
                fontSize: 16
              ),
            ),
            TextField(
              controller: marcaController,
              decoration: InputDecoration(
                  labelText: "Nome da Marca do Produto",
                  hintText: "Digite o Nome da Marca"
              ),
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            TextField(
              controller: precoController,
              decoration: InputDecoration(
                  labelText: "Preço do Produto",
                  hintText: "Digite o Preço do Produto"
              ),
              style: TextStyle(
                  fontSize: 16
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: validadeController,
              decoration: InputDecoration(
                  labelText: "Validade do Produto",
                  hintText: "Digite a Validade do Produto"
              ),
              style: TextStyle(
                  fontSize: 16
              ),
              keyboardType: TextInputType.datetime,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: ()async{
                    if(nomeController.text.trim().isEmpty||marcaController.text.trim().isEmpty||precoController.text.trim().isEmpty||validadeController.text.trim().isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Preencha todos os campos"),
                              duration: Duration(milliseconds: 300),
                              backgroundColor: Colors.redAccent)
                      );
                      return;
                    }
                    Produto produto = Produto();
                    produto.nome = nomeController.text;
                    produto.marca = marcaController.text;
                    produto.preco = double.parse(precoController.text);
                    produto.validade = validadeController.text;
                    await banco.salvar(produto);
                    nomeController.text = "";
                    marcaController.text = "";
                    precoController.text = "";
                    validadeController.text = "";
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("Cadastrado com sucesso"),
                            duration: Duration(milliseconds: 500),
                            backgroundColor: Colors.lightGreen));
                  },
                  child: Text("Cadastrar",
                          style: TextStyle(
                            color: Colors.white
                          ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                  ),
                ),)
          ],
        ),
      ),
    );
  }
}
