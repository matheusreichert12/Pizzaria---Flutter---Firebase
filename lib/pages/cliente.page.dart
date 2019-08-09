import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as prefix0;
import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  ClientePage({this.idDocument});
  final String idDocument;
  State<StatefulWidget> createState() =>
      ClientePageState(idDocument: this.idDocument);
}

var nome = TextEditingController();

class ClientePageState extends State<ClientePage> {
  @override
  initState() {
    super.initState();
    // Add listeners to this class
    abrirTela();
  }

  abrirTela() {
    Firestore.instance
        .collection("usuarios")
        .document(this.idDocument)
        .snapshots()
        .forEach((DocumentSnapshot docs) {
      if (docs.data.length != 0) {
        nome.text = docs.data['nome'];

        //adicionar os outros campos
      }
    });
  }

  ClientePageState({this.idDocument});
  final String idDocument;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Dados Pessoais",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: nome,
              decoration: InputDecoration(
                hintText: "Nome",
                icon: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Telefone",
                icon: Icon(Icons.phone),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "E-mail",
                icon: Icon(Icons.email),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Cidade",
                icon: Icon(Icons.location_city),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Bairro",
                icon: Icon(Icons.location_city),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Rua",
                icon: Icon(Icons.location_city),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Nº",
                icon: Icon(Icons.location_city),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [
                  Colors.redAccent[400],
                  Colors.red[600],
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      )),
    );
  }
}
