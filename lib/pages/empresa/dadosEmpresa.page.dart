import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DadosEmpresaPage extends StatefulWidget {
  DadosEmpresaPage({this.idDocument, this.idEmpresa});
  final String idDocument;
  final String idEmpresa;
  @override
  _DadosEmpresaPageState createState() => _DadosEmpresaPageState(
      idDocument: this.idDocument, idEmpresa: this.idEmpresa);
}

var nome = TextEditingController();
var telefone = TextEditingController();
var cidade = TextEditingController();
var bairro = TextEditingController();
var rua = TextEditingController();
var n = TextEditingController();

class _DadosEmpresaPageState extends State<DadosEmpresaPage> {
  _DadosEmpresaPageState({this.idDocument, this.idEmpresa});
  final String idDocument;
  final String idEmpresa;
  @override
  initState() {
    super.initState();
    // Add listeners to this class
    abrirTela();
  }

  abrirTela() {
    Firestore.instance
        .collection("empresa")
        .where("idusuario", isEqualTo: this.idDocument)
        .getDocuments()
        .then((QuerySnapshot docs) {
      if (docs.documents.length != 0) {
        nome.text = docs.documents[0].data['nome'];
        telefone.text = docs.documents[0].data['telefone'];
        cidade.text = docs.documents[0].data['cidade'];
        bairro.text = docs.documents[0].data['bairro'];
        rua.text = docs.documents[0].data['rua'];
        n.text = docs.documents[0].data['n'];
      }
    });
  }

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
            "Dados Empresa",
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
                hintText: "Nome empresa",
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
        .collection("empresa")
        .document(this.idEmpresa)
        .updateData({
      'nome': nome.text,
      'telefone': telefone.text,
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
