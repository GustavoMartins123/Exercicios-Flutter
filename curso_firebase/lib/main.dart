import 'package:curso_firebase/Principal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main()async{
  InicarFirebase();
  runApp(MaterialApp(
    home: Principal(),
  ));
}

Future<FirebaseOptions> configuracaoFirebase() async {
  return FirebaseOptions(
    apiKey: 'AIzaSyBc6pYH0kvZb2AxoBBzd65_m1Oyma704kU',
    projectId: 'cursoflutterfirebase-4d3bf',
    storageBucket: 'cursoflutterfirebase-4d3bf.appspot.com',
    messagingSenderId: '455674432586',
    appId: '1:455674432586:android:b3495df95ed6c767b0eab3',
  );
}
void InicarFirebase() async {
  FirebaseOptions options = await configuracaoFirebase();
  await Firebase.initializeApp(options: options);
  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  // dataBase.collection("funcionario")
  //   .add({"nome" : "Alfreda", "idade" : 25});
  // dataBase.collection("funcionario")
  //   .doc("K8P5kqO0n6dqVBvpiyBU")
  //   .set({"nome" : "Gerald", "idade" : 55});
  // dataBase.collection("funcionario")
  //     .doc("K8P5kqO0n6dqVBvpiyBU")
  //     .delete();
  // dataBase.collection("produtos")
  //   .doc("001")
  //   .set({"nome" : "soja", "marca" : "idr", "preco" : 10.54, "validade" : "24/08/2024"});
  // dataBase.collection("produtos")
  //     .doc("002")
  //     .set({"nome" : "cenoura", "marca" : "jordan", "preco" : 18.54, "validade" : "30/08/2025"});
  // dataBase.collection("produtos")
  //     .doc("003")
  //     .set({"nome" : "soja", "marca" : "idr", "preco" : 10.54, "validade" : "24/08/2024"});
  // dataBase.collection("produtos")
  //     .doc("004")
  //     .set({"nome" : "café", "marca" : "petrobras", "preco" : 30.54, "validade" : "28/09/2024"});
  // DocumentSnapshot snapshot = await dataBase.collection("produtos").doc("004").get();
  // print(snapshot.get("nome"));
  // print(snapshot.get("marca"));
  // print(snapshot.get("preco").toString());
  // print(snapshot.get("validade"));

  //recuperar todos os produtos
  // QuerySnapshot todos = await dataBase.collection("produtos").get();
  // todos.docs.forEach((action){
  //   var dado = action.data() as Map<String, dynamic>;
  //   print("Nome: ${dado["nome"]}\nMarca: ${dado["marca"]}\nPreço: ${dado["preco"]}\nValidade: ${dado["validade"]}");
  // });

  //listener
  // dataBase.collection("produtos").snapshots().listen((onData){
  //   onData.docs.forEach((action){
  //     var dado = action.data() as Map<String, dynamic>;
  //     print("Nome: ${dado["nome"]}\nMarca: ${dado["marca"]}\nPreço: ${dado["preco"]}\nValidade: ${dado["validade"]}");
  //   });
  // });

  //filter
  QuerySnapshot todos = await dataBase.collection("produtos")
      .where("marca", isEqualTo: "idr")
      .get();
  todos.docs.forEach((action) {
    var dado = action.data() as Map<String, dynamic>;
    print(
        "Nome: ${dado["nome"]}\nMarca: ${dado["marca"]}\nPreço: ${dado["preco"]}\nValidade: ${dado["validade"]}");
  });
}