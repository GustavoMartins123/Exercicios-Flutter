import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController campoGasolina = TextEditingController();
  TextEditingController campoAlcool = TextEditingController();
  String resultado = "Resultado";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gasolina, Alcool ou Bike",
            style: TextStyle(
             color: Colors.white
            )
          ,
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      "imagens/bike1.jpeg",
                      scale: 2,
                  ),
                  Image.asset(
                      "imagens/combustiveis.jpeg",
                      scale: 2.25,
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(resultado,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: campoGasolina,
                    style: TextStyle(
                      fontSize: 20
                    ),
                    decoration: InputDecoration(
                      labelText: "Digite o preço da Gasolina"
                    ),
                    keyboardType: TextInputType.number,
                  ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: campoAlcool,
                  style: TextStyle(
                      fontSize: 20
                  ),
                  decoration: InputDecoration(
                      labelText: "Digite o preço do Alcool"
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    if(campoGasolina.text.isEmpty|| campoAlcool.text.isEmpty){
                      print("Algum campo vazio");
                      return;
                    }
                    double precoGasolina = double.parse(campoGasolina.text);
                    double precoAlcool = double.parse(campoAlcool.text);
                    if(precoGasolina <= 0|| precoAlcool <= 0){
                      setState(() {
                        resultado = "Digite um valor válido";
                      });
                    }
                    else if(precoGasolina >= 10 && precoAlcool >= 10){
                      setState(() {
                        resultado = "Melhor ir de bicicleta";
                      });
                    }
                    else if((precoAlcool/precoGasolina) >= 0.7){
                      setState(() {
                        resultado = "Melhor abastecer com gasolina";
                      });
                    }
                    else{
                      setState(() {
                        resultado = "Melhor abastecer com alcool";
                      });
                    }

                  },
                  child: Text("Calcular"))
            ],
          ),
        ),
      ),
    );
  }
}