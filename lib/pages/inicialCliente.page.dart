import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/cliente.page.dart';
import 'package:todo/pages/pedidoCliente.page.dart';

class InicialClientePage extends StatefulWidget {
  State<StatefulWidget> createState() => InicialClientePageState();
}

class InicialClientePageState extends State<InicialClientePage> {
  int _pageIndex = 0;

  Widget _showPage = new PedidoClientePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return PedidoClientePage();
        break;
      case 1:
        return ClientePage(title: 'asd123');
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
          Icon(Icons.local_pizza, size: 30, color: Colors.white),
          Icon(Icons.perm_identity, size: 30, color: Colors.white),
          Icon(Icons.exit_to_app, size: 30, color: Colors.white),
        ],
        color: Colors.redAccent[400],
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
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
