import 'package:flutter/material.dart';
import 'package:todo/pages/cardapioCliente.page.dart';
import 'package:todo/pages/empresa/dadosEmpresa.page.dart';
import 'package:todo/pages/empresa/tamanhosPizzaEmpresa.page.dart';

class InicialEmpresaPage extends StatefulWidget {
  InicialEmpresaPage({this.idDocument, this.idEmpresa});
  final String idDocument;
  final String idEmpresa;
  @override
  _InicialEmpresaPageState createState() => _InicialEmpresaPageState(
      idDocument: this.idDocument, idEmpresa: this.idEmpresa);
}

class _InicialEmpresaPageState extends State<InicialEmpresaPage> {
  _InicialEmpresaPageState({this.idDocument, this.idEmpresa});
  final String idDocument;
  final String idEmpresa;

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
      case 2:
        return TamanhosPizzaEmpresaPage(idDocument: this.idDocument);
        break;
      case 3:
        return DadosEmpresaPage(
          idDocument: this.idDocument,
          idEmpresa: this.idEmpresa,
        );
        break;
      default:
        return new Container(
          child: Text("Página não encontrada"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        elevation: 5,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.fastfood,
              color: Colors.redAccent,
            ),
            title: new Text(
              'Pedidos',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_pizza, color: Colors.redAccent),
            title: new Text(
              'Sabores',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build, color: Colors.redAccent),
            title: Text(
              'Tamanhos Pizzas',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.redAccent),
            title: Text(
              'Dados Empresa',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
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
