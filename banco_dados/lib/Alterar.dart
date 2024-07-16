import 'package:flutter/material.dart';
import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';

class Alterar extends StatefulWidget {
  const Alterar({super.key});

  @override
  State<Alterar> createState() => _AlterarState();
}

class _AlterarState extends State<Alterar> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController marcaController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController validadeController = TextEditingController();
  Banco banco = Banco();
  List<Produto> listaProdutos = [];

  buscarProdutos() async {
    List lista = await banco.getProdutos();
    lista.forEach((action) {
      Produto p = Produto();
      p.id = action["id"];
      p.nome = action["nome"];
      p.marca = action["marca"];
      p.preco = action["preco"];
      p.validade = action["validade"];
      setState(() {
        listaProdutos.add(p);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
          itemCount: listaProdutos.length,
          itemBuilder: (context, indice) {
            return ListTile(
              title: Text(listaProdutos[indice].nome),
              subtitle: Text(
                  "Preço: ${listaProdutos[indice].preco} - Marca: ${listaProdutos[indice].marca}"),
              onTap: () {
                Produto produto = listaProdutos[indice];
                nomeController.text = produto.nome;
                marcaController.text = produto.marca;
                precoController.text = produto.preco.toString();
                validadeController.text = produto.validade;
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Alterar Produto"),
                          actionsPadding: EdgeInsets.all(15),
                          shape: Border.all(style: BorderStyle.none),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextField(
                                  controller: nomeController,
                                  decoration: InputDecoration(
                                      labelText: "Nome do Produto",
                                      hintText: "Digite o Nome"),
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextField(
                                  controller: marcaController,
                                  decoration: InputDecoration(
                                      labelText: "Nome da Marca do Produto",
                                      hintText: "Digite o Nome da Marca"),
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextField(
                                  controller: precoController,
                                  decoration: InputDecoration(
                                      labelText: "Preço do Produto",
                                      hintText: "Digite o Preço do Produto"),
                                  style: TextStyle(fontSize: 16),
                                  keyboardType: TextInputType.number,
                                ),
                                TextField(
                                  controller: validadeController,
                                  decoration: InputDecoration(
                                      labelText: "Validade do Produto",
                                      hintText: "Digite a Validade do Produto"),
                                  style: TextStyle(fontSize: 16),
                                  keyboardType: TextInputType.datetime,
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (nomeController.text.trim().isEmpty ||
                                        marcaController.text.trim().isEmpty ||
                                        precoController.text.trim().isEmpty ||
                                        validadeController.text
                                            .trim()
                                            .isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Preencha todos os campos"),
                                              duration:
                                                  Duration(milliseconds: 300),
                                              backgroundColor:
                                                  Colors.redAccent));
                                      return;
                                    }
                                    Produto produto = Produto();
                                    produto.id = listaProdutos[indice].id;
                                    produto.nome = nomeController.text;
                                    produto.marca = marcaController.text;
                                    produto.preco =
                                        double.parse(precoController.text);
                                    produto.validade = validadeController.text;
                                    await banco.alterar(produto);
                                    setState(() {
                                      listaProdutos[indice].nome = produto.nome;
                                      listaProdutos[indice].marca =
                                          produto.marca;
                                      listaProdutos[indice].preco =
                                          produto.preco;
                                      listaProdutos[indice].validade =
                                          produto.validade;
                                    });
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Atualizado com sucesso"),
                                            duration:
                                                Duration(milliseconds: 800),
                                            backgroundColor:
                                                Colors.lightGreen));
                                  },
                                  child: Text(
                                    "Salvar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent)),
                            )
                          ],
                        ));
              },
            );
          }),
    );
  }
}
