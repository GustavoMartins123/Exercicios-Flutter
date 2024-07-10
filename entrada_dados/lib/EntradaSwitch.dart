import 'package:flutter/material.dart';
class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({super.key});

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Switch",
              style: TextStyle(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Column(
          children: [
            SwitchListTile(
                activeColor: Colors.blueAccent,
                title: Text("Receber notificações"),
                subtitle: Text("Será enviadas varias notificações por dia"),
                secondary: Icon(Icons.add_alert),
                value: valor,
                onChanged: (valorBool){
                  setState(() {
                    valor = valorBool;
                  });
                })
          ],
        ),
      ),
    );
  }
}
