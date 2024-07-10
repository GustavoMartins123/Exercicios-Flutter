import 'package:flutter/material.dart';
class EntradaCheckBox extends StatefulWidget {
  const EntradaCheckBox({super.key});

  @override
  State<EntradaCheckBox> createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  bool valor = false;
  bool valor2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Check Box",
                style: TextStyle(
                  color: Colors.white
                ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Column(
          children: [
            // Checkbox(
            //     value: true,
            //     onChanged: (valor){
            //       print("Mudado");
            //     })
            CheckboxListTile(
                title: Text("Valor"),
                subtitle: Text("IDR"),
                secondary: Icon(
                  Icons.cabin
                ),
                activeColor: Colors.deepPurpleAccent,
                value: valor,
                onChanged: (valorBool){
                  setState(() {
                    valor = valorBool!;
                  });
                }),
            CheckboxListTile(
                title: Text("Valor2"),
                subtitle: Text("IDR2"),
                secondary: Icon(
                    Icons.ice_skating
                ),
                activeColor: Colors.deepPurpleAccent,
                value: valor2,
                onChanged: (valorBool){
                  setState(() {
                    valor2 = valorBool!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
