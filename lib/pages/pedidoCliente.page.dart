import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PedidoClientePage extends StatefulWidget {
  @override
  _PedidoClientePageState createState() => _PedidoClientePageState();
}

class _PedidoClientePageState extends State<PedidoClientePage> {
  String teste;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Testando FireStore"),
      ),
      body: new StreamBuilder(
        stream: Firestore.instance.collection("usuarios").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Conectando...");
          }

          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              teste = snapshot.data.documents[index].documentID;
              return new Text(snapshot.data.documents[index].data['login']);
            },
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          update(teste, {'login': 'teste2', 'senha': 'oktiu', 'adm': '3'});
          //Firestore.instance.collection("usuarios").document().delete();
        },
        tooltip: 'Icrement',
        child: new Icon(Icons.add),
      ),
    );
  }

  getData() async {
    return Firestore.instance.collection("usuarios").snapshots();
  }

  void update(selectDoc, newValues) {
    Firestore.instance
        .collection("usuarios")
        .document(selectDoc)
        .setData(newValues)
        .catchError((e) {
      print(e);
    });
  }
}