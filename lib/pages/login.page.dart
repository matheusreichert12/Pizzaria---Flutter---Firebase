import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/criarConta.page.dart';
import 'package:todo/pages/empresa/inicialEmpresa.page.dart';
import 'package:todo/pages/inicialCliente.page.dart';

class LoginPage extends StatefulWidget {
  final String title = "Login";

  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _login = TextEditingController();
  final _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 118,
              height: 118,
              child: Image.asset("assets/pizzaLogo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _login,
              decoration: InputDecoration(
                labelText: "Login",
                labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: _senha,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
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
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    verificaLogin();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: FlatButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CriarContaPage())),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  verificaLogin() {
    String id = "";
    Firestore.instance
        .collection("usuarios")
        .where("login", isEqualTo: _login.text)
        .where("senha", isEqualTo: _senha.text)
        .getDocuments()
        .then((QuerySnapshot docs) {
      if (docs.documents.length != 0) {
        if (docs.documents[0].data['admin'] == 1) {
          id = docs.documents[0].documentID;

          Firestore.instance
              .collection("empresa")
              .where("idusuario", isEqualTo: docs.documents[0].documentID)
              .getDocuments()
              .then((QuerySnapshot docs2) {
            if (docs2.documents.length == 0) {
              Firestore.instance.collection("empresa").document().setData({
                'idusuario': id,
                'nome': '',
                'telefone': '',
                'cidade': '',
                'bairro': '',
                'rua': '',
                'n': ''
              });
              Firestore.instance
                  .collection("empresa_tamanho")
                  .document()
                  .setData({
                'idusuario': id,
                'descricao': '',
                'quantidade_sabor': 0,
                'pessoas': 0,
                'valor': double.parse("0,00")
              });

              Firestore.instance
                  .collection("empresa")
                  .where("idusuario", isEqualTo: docs.documents[0].documentID)
                  .getDocuments()
                  .then((QuerySnapshot docs3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InicialEmpresaPage(
                            idDocument: docs.documents[0].documentID,
                            idEmpresa: docs3.documents[0].documentID)));
              });
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InicialEmpresaPage(
                          idDocument: docs.documents[0].documentID,
                          idEmpresa: docs2.documents[0].documentID)));
            }
          });
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InicialClientePage(
                        idDocument: docs.documents[0].documentID,
                      )));
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Text("Login e senha inválidos"),
              actions: <Widget>[
                // define os botões na base do dialogo
                new FlatButton(
                  child: new Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }
}
