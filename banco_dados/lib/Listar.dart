import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:flutter/material.dart';
class Listar extends StatefulWidget {
  const Listar({super.key});

  @override
  State<Listar> createState() => _ListarState();
}

class _ListarState extends State<Listar> {
  Banco banco = Banco();
  List<Produto> listaProdutos = [];
  buscarProdutos()async{
    List lista = await banco.getProdutos();
    lista.forEach((action){
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
          itemBuilder: (context, indice){
            return ListTile(
              title: Text(listaProdutos[indice].nome),
              subtitle: Text("Preço: ${listaProdutos[indice].preco} - Marca: ${listaProdutos[indice].marca}"),
            );
          }),
    );
  }
}
