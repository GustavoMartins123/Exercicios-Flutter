import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}
class _PrincipalState extends State<Principal> {
  TextEditingController campoEstacao = TextEditingController();
  TextEditingController campoDia = TextEditingController();
  Map<String, dynamic> resultado = {};
  String horaEscolhida = "manha";
  Future<void> getValor() async {
    if(campoEstacao.text.trim().isEmpty || campoDia.text.trim().isEmpty){
      return;
    }
    http.Response response = await http.get(Uri.parse("https://apiprevmet3.inmet.gov.br/previsao/${campoEstacao.text}"));
    if (response.statusCode == 200) {
      setState(() {
        resultado = convert.jsonDecode(response.body);
        if (resultado.containsKey(campoEstacao.text) &&
            resultado[campoEstacao.text].containsKey(campoDia.text) &&
            resultado[campoEstacao.text][campoDia.text].containsKey(horaEscolhida)) {
          resultado[campoEstacao.text][campoDia.text][horaEscolhida].remove("icone");
          resultado[campoEstacao.text][campoDia.text][horaEscolhida].remove("cod_icone");
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Flutter Api",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: campoEstacao,
                maxLength: 7,
                decoration: InputDecoration(
                  labelText: "Digite o código da estação. Ex: 4103701"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: campoDia,
                maxLength: 10,
                decoration: InputDecoration(
                    labelText: "Digite a data. Ex: 11/07/2024"
                ),
              ),
            ),
            RadioListTile(
                title: Text("manha"),
                value: "manha",
                groupValue: horaEscolhida,
                onChanged: (String? escolha){
                  setState(() {

                    horaEscolhida = escolha!;
                  });
                }),
            RadioListTile(
                title: Text("tarde"),
                value: "tarde",
                groupValue: horaEscolhida,
                onChanged: (String? escolha){
                  setState(() {
                    horaEscolhida = escolha!;
                  });
                }),
            RadioListTile(
                title: Text("noite"),
                value: "noite",
                groupValue: horaEscolhida,
                onChanged: (String? escolha){
                  setState(() {
                    horaEscolhida = escolha!;
                  });
                }),
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: ElevatedButton(
                    onPressed: () async {
                      await getValor();
                    },
                    child: Text("Procurar")
                ),
            ),
            Text(
                resultado.containsKey(campoEstacao.text) &&
                    resultado[campoEstacao.text].containsKey(campoDia.text) &&
                    resultado[campoEstacao.text][campoDia.text].containsKey(horaEscolhida)
                    ?"Hora: $horaEscolhida\n"
                    "Estado: ${resultado[campoEstacao.text][campoDia.text][horaEscolhida]["uf"]}\n"
                    "Cidade: ${resultado[campoEstacao.text][campoDia.text][horaEscolhida]["entidade"]}\n"
                    "Resumo: ${resultado[campoEstacao.text][campoDia.text][horaEscolhida]["resumo"]}\n"
                    "Temperatura máxima: ${resultado[campoEstacao.text][campoDia.text][horaEscolhida]["temp_max"]}°C\n"
                    "Temperatura mínima: ${resultado[campoEstacao.text][campoDia.text][horaEscolhida]["temp_min"]}°C\n"
                    "Intensidade do vento: ${resultado[campoEstacao.text][campoDia.text][horaEscolhida]["int_vento"]}"
                    : "")
          ],
        ),
      ),
    );
  }
}