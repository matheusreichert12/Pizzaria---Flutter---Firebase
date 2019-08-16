import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  ClientePage({this.idDocument});
  final String idDocument;
  State<StatefulWidget> createState() =>
      ClientePageState(idDocument: this.idDocument);
}

var nome = TextEditingController();
var telefone = TextEditingController();
var email = TextEditingController();
var cidade = TextEditingController();
var bairro = TextEditingController();
var rua = TextEditingController();
var n = TextEditingController();

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
        telefone.text = docs.data['telefone'];
        email.text = docs.data['email'];
        cidade.text = docs.data['cidade'];
        bairro.text = docs.data['bairro'];
        rua.text = docs.data['rua'];
        n.text = docs.data['n'];
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
              keyboardType: TextInputType.text,
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
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: telefone,
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
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
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
            child: TextField(
              keyboardType: TextInputType.text,
              controller: cidade,
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
            child: TextField(
              keyboardType: TextInputType.text,
              controller: bairro,
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
            child: TextField(
              keyboardType: TextInputType.text,
              controller: rua,
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
            child: TextField(
              keyboardType: TextInputType.number,
              controller: n,
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
                onPressed: () {
                  update();
                },
              ),
            ),
          ),
        ],
      )),
    );
  }

  void update() {
    Firestore.instance
        .collection("usuarios")
        .document(this.idDocument)
        .updateData({
      'nome': nome.text,
      'telefone': telefone.text,
      'email': email.text,
      'cidade': cidade.text,
      'bairro': bairro.text,
      'rua': rua.text,
      'n': n.text
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("Dados Atualizados com Sucesso!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
