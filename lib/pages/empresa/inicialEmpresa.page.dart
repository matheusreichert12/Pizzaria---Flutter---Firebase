import 'package:flutter/material.dart';
import 'package:todo/pages/cardapioCliente.page.dart';
import 'package:todo/pages/empresa/tamanhosPizzaEmpresa.page.dart';

class InicialEmpresaPage extends StatefulWidget {
  InicialEmpresaPage({this.idDocument});
  final String idDocument;
  @override
  _InicialEmpresaPageState createState() =>
      _InicialEmpresaPageState(idDocument: this.idDocument);
}

class _InicialEmpresaPageState extends State<InicialEmpresaPage> {
  _InicialEmpresaPageState({this.idDocument});
  final String idDocument;

  int _currentIndex = 0;

  Widget _showPage = new CardapioClientePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return CardapioClientePage();
        break;
      case 1:
        return CardapioClientePage();
        break;
      default:
        return TamanhosPizzaEmpresaPage(idDocument: this.idDocument);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.fastfood),
            title: new Text('Pedidos'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_pizza),
            title: new Text('Sabores'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text('Tamanhos Pizzas'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _showPage = _pageChooser(index);
    });
  }
}
