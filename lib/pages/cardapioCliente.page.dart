import 'package:flutter/material.dart';

class CardapioClientePage extends StatefulWidget {
  @override
  _CardapioClientePageState createState() => _CardapioClientePageState();
}

class _CardapioClientePageState extends State<CardapioClientePage> {
  String dropdownValue = "Média";
  int radioGroup = 2;

  String quant = "3";
  bool _isTextFieldVisible = false;

  radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
      _isTextFieldVisible = !_isTextFieldVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Escolher Sabores"),
      ),
      body: new Container(
        child: new ListView(
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
                    if (newValue == "Broto") {
                      quant = "1";
                    }
                    if (newValue == "Pequena") {
                      quant = "2";
                    }
                    if (newValue == "Média") {
                      quant = "3";
                    }
                    if (newValue == "Grande") {
                      quant = "4";
                    }
                    if (newValue == "Família") {
                      quant = "5";
                    }
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Quantidade de fatias: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    quant,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            RadioListTile<int>(
              value: 1,
              groupValue: radioGroup,
              onChanged: radioEventHandler,
              title: new Text("Com Borda"),
            ),
            RadioListTile<int>(
              value: 2,
              groupValue: radioGroup,
              onChanged: radioEventHandler,
              title: new Text("Sem Borda"),
            ),
            SizedBox(
              height: 20,
            ),
            _isTextFieldVisible
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("Sabor da borda"),
                  )
                : SizedBox(
                    height: 20,
                  ),
          ],
        ),
      ),
    );
  }
}
