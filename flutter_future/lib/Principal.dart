import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List listaMoedas = [];
  String statusConexao = "";
  Future<Map> buscarCotacao() async{
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
        return convert.jsonDecode(response.body);
    }
    return Map();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cotações",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<Map>(
        future: buscarCotacao(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.waiting:
              statusConexao = "Aguardando";
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              statusConexao = "Finalizado";
              if(snapshot.hasError){
                statusConexao = "Erro ao carregar os dados";
                break;
              }
              snapshot.data?.values.forEach((element){
                  Map<String, dynamic> moedaCrypto = Map();
                  moedaCrypto["nome"] = element["symbol"];
                  moedaCrypto["cotacaoDeCompra"] = element["buy"];
                  moedaCrypto["cotacaoDeVenda"] = element["sell"];
                  listaMoedas.add(moedaCrypto);
              });
              break;
          }
          return Padding(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: listaMoedas.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(listaMoedas[index]["nome"]),
                      subtitle: Text(listaMoedas[index]["cotacaoDeCompra"].toString()),
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(listaMoedas[index]["nome"]),
                              titlePadding: EdgeInsets.all(22),
                              titleTextStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.deepPurple
                              ),
                              content: Text("Preço de Compra: ${listaMoedas[index]["cotacaoDeCompra"]}\nPreço de Venda: ${listaMoedas[index]["cotacaoDeVenda"]}"),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Sair"))
                                  ],
                                )
                              ],
                            ));
                      },
                    );
                  }),
          );
        },
      ),
    );
  }
}
