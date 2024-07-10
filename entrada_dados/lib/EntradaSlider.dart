import 'package:flutter/material.dart';
class EntradaSlider extends StatefulWidget {
  const EntradaSlider({super.key});

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double valor = 5;
  String meuLabel = "5";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Slider",
                style: TextStyle(
                  color: Colors.white
                ),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Slider(
                value: valor,
                min: 0,
                max: 10,
                label: meuLabel,
                divisions: 10,
                activeColor: Colors.deepPurpleAccent,
                onChanged: (double valorEscolhido){
                  setState(() {
                    valor = valorEscolhido;
                    meuLabel = valor.toString();
                  });
                }),
            ElevatedButton(
                onPressed: (){
                  print("Valor slider: $valor");
                },
                child: Text("Salvar valor"))
          ],
        ),
      ),
    );
  }
}
