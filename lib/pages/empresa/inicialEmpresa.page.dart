import 'package:flutter/material.dart';
import 'package:todo/pages/cardapioCliente.page.dart';
import 'package:todo/pages/empresa/tamanhosPizzaEmpresa.page.dart';

class InicialEmpresaPage extends StatefulWidget {
  @override
  _InicialEmpresaPageState createState() => _InicialEmpresaPageState();
}

int _currentIndex = 0;
final List<Widget> _children = [
  CardapioClientePage(),
  CardapioClientePage(),
  TamanhosPizzaEmpresaPage()
];

class _InicialEmpresaPageState extends State<InicialEmpresaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
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
    });
  }
}
