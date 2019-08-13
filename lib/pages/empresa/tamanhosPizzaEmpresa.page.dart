import 'package:flutter/material.dart';

class TamanhosPizzaEmpresaPage extends StatefulWidget {
  @override
  _TamanhosPizzaEmpresaPageState createState() =>
      _TamanhosPizzaEmpresaPageState();
}

class _TamanhosPizzaEmpresaPageState extends State<TamanhosPizzaEmpresaPage> {
  String dropdownValue = "Média";
  int radioGroup = 2;
  int radioGroup2 = 1;

  String quant = "3";
  bool _isTextFieldVisible = false;

  radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
      _isTextFieldVisible = !_isTextFieldVisible;
    });
  }

  radioEventHandler2(int value) {
    setState(() {
      radioGroup2 = value;
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Tamanho da pizza",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  "Broto",
                  "Pequena",
                  "Média",
                  "Grande",
                  "Família"
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 13)),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                keyboardType: TextInputType.number,
                //controller: n,
                decoration: InputDecoration(
                  hintText: "Quantidade de Fatias",
                  icon: Icon(Icons.local_pizza),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
