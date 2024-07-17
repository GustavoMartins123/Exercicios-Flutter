import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  salvarArquivo()async{
    final diretorio = await getApplicationDocumentsDirectory();
    File arquivo = File("${diretorio.path}/arquivo.json");
    String conteudo = json.encode(itens);
    arquivo.writeAsString(conteudo);
  }
  lerArquivo()async{
    try{
      final diretorio = await getApplicationDocumentsDirectory();
      File arquivo = File("${diretorio.path}/arquivo.json");
      return arquivo.readAsString();
    }catch(error){
      return null;
    }
  }
  List itens = [];
  bool checkBox = false;
  void setCheckBox(value){
    setState(() {
      checkBox = value;
    });
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lerArquivo().then((conteudo){
      setState(() {
        itens = json.decode(conteudo);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController itemController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
        backgroundColor: Colors.green,
      ),
      body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: itens.length,
                    itemBuilder: (context, indice){
                      return Dismissible(
                          key: Key(itens[indice]["Nome"]),
                          direction: DismissDirection.horizontal,
                          child: CheckboxListTile(
                            title: Text(itens[indice]["Nome"]),
                            onChanged: (bool? value) {
                              setState(() {
                                itens[indice]["Finalizado"] = value;
                              });
                              salvarArquivo();
                            },
                            value: itens[indice]["Finalizado"],
                            activeColor: Colors.green,
                          ),
                      confirmDismiss: (direction) async{
                        if(direction == DismissDirection.endToStart){
                          itens.removeAt(indice);
                          salvarArquivo();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Excluído com sucesso",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  duration: Duration(
                                      milliseconds: 500
                                  ),
                                  backgroundColor: Colors.redAccent
                              ));
                          return true;
                        }
                        else{
                          itemController.text = itens[indice]["Nome"];
                          checkBox = itens[indice]["Finalizado"];
                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: ( BuildContext context, StateSetter setState) {
                                      return AlertDialog(
                                        title: Text("Alterar Tarefa"),
                                        content: TextField(
                                            controller: itemController,
                                            decoration:  InputDecoration(
                                                labelText: "Digite a nova Tarefa"
                                            )
                                        ),
                                        actions: [
                                          Container(
                                            child: Column(
                                              children: [
                                                CheckboxListTile(
                                                  title: Text("Finalizado?"),
                                                  value: checkBox,
                                                  onChanged: (bool? valor){
                                                    print("Checbok:$checkBox");
                                                    setState(() {
                                                      setCheckBox(valor);
                                                    });
                                                  },
                                                ),
                                                Center(
                                                    child: ElevatedButton(
                                                        onPressed: (){
                                                          if(itemController.text.trim().isEmpty){
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(
                                                                    content: Text("Não pode ser vazio",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold
                                                                      ),),
                                                                    duration: Duration(
                                                                        milliseconds: 500
                                                                    ),
                                                                    backgroundColor: Colors.redAccent
                                                                )
                                                            );
                                                            return;
                                                          }
                                                          salvarArquivo();
                                                          Navigator.pop(context, {
                                                            "Nome": itemController.text,
                                                            "Finalizado": checkBox,
                                                          });
                                                        },
                                                        child: Text("Salvar"))
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                );
                              }
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                itens[indice]["Nome"] = value["Nome"];
                                itens[indice]["Finalizado"] = value["Finalizado"];
                              });
                              itemController.text = "";
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Tarefa alterada"),
                                  duration: Duration(milliseconds: 800),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          });
                          salvarArquivo();
                        return false;
                        }
                      },
                      background: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.note_alt_outlined,
                              color: Colors.white,)
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.delete_outline,
                              color: Colors.white,)
                          ],
                        ),
                      ));
                    }))
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: Border.all(
          width: 2
        ),
        onPressed: (){
          itemController.text = "";
          showDialog(
              context: context,
              builder: (context)=>  AlertDialog(
               title: Text("Adicionar Tarefa"),
               content: TextField(
                   controller: itemController,
                   decoration:  InputDecoration(
                     labelText: "Digite a Tarefa"
                   )
               ),
                actions: [
                  ElevatedButton(
                      onPressed: (){
                        if(itemController.text.trim().isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Não pode ser vazio",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),),
                                duration: Duration(
                                  milliseconds: 500
                                ),
                                backgroundColor: Colors.redAccent
                            )
                          );
                          return;
                        }
                        Map<String, dynamic> item = Map();
                        item["Nome"] = itemController.text;
                        item["Finalizado"] = false;
                          setState(() {
                            itens.add(item);
                          });
                          salvarArquivo();
                        itemController.text = "";
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Tarefa adicionada"),
                                  duration: Duration(milliseconds: 800),
                                  backgroundColor: Colors.green,),
                        );
                      },
                      child: Text("Adicionar"))
                ],
              ));
        },
        label: Text("Adicionar Tarefa"),
        icon: Icon(Icons.add_circle_outline)
      ),
    );
  }
}
