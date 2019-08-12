import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/cliente.page.dart';
import 'package:todo/pages/criarConta.page.dart';
import 'package:todo/pages/login.page.dart';

class PedidoClientePage extends StatefulWidget {
  @override
  _PedidoClientePageState createState() => _PedidoClientePageState();
}

int _currentIndex = 0;
final List<Widget> _children = [ClientePage(), LoginPage(), CriarContaPage()];

class _PedidoClientePageState extends State<PedidoClientePage> {
  String teste;

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
            title: new Text('Cardápio'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.attach_money),
            title: new Text('Valores'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Carrinho'),
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
