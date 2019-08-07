import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/cliente.page.dart';
import 'package:todo/pages/login.page.dart';

class InicialClientePage extends StatefulWidget {
  State<StatefulWidget> createState() => InicialClientePageState();
}

class InicialClientePageState extends State<InicialClientePage> {
  int _pageIndex = 0;

  final ClientePage _clientePage = ClientePage();
  final LoginPage _loginPage = LoginPage();

  Widget _showPage = new ClientePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _loginPage;
        break;
      case 1:
        return _clientePage;
        break;
      default:
        return new Container(
          child: new Text("Página não encontrada"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        initialIndex: _pageIndex,
        items: <Widget>[
          Icon(Icons.local_pizza, size: 30),
          Icon(Icons.perm_identity, size: 30),
          Icon(Icons.exit_to_app, size: 30)
        ],
        color: Colors.redAccent[200],
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
