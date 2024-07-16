import 'package:flutter/material.dart';
import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
class Excluir extends StatefulWidget {
  const Excluir({super.key});

  @override
  State<Excluir> createState() => _ExcluirState();
}

class _ExcluirState extends State<Excluir> {
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
              return Dismissible(
                  key: Key(listaProdutos[indice].id.toString()),
                  direction: DismissDirection.endToStart,
                  child: ListTile(
                      title: Text(listaProdutos[indice].nome),
                    subtitle: Text("Preço: ${listaProdutos[indice].preco} - Marca: ${listaProdutos[indice].marca}"),
                  ),
                  onDismissed: (direction) async{
                    await banco.apagar(listaProdutos[indice].id);
                    listaProdutos.removeAt(indice);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Produto excluído com sucesso"),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.redAccent)
                    );
                  },
                background: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.redAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                      )
                    ],
                  ),
                ),
              );

            }
      )
    );
  }
}
