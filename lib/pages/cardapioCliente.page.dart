import 'package:flutter/material.dart';

class CardapioClientePage extends StatefulWidget {
  @override
  _CardapioClientePageState createState() => _CardapioClientePageState();
}

class _CardapioClientePageState extends State<CardapioClientePage> {
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
      appBar: new AppBar(
        title: new Text("Formato Pizza"),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
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
            if (_isTextFieldVisible)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text("Sabor da borda"),
              ),
            if (_isTextFieldVisible)
              RadioListTile<int>(
                value: 1,
                groupValue: radioGroup2,
                onChanged: radioEventHandler2,
                title: new Text("Catupiry"),
              ),
            if (_isTextFieldVisible)
              RadioListTile<int>(
                value: 2,
                groupValue: radioGroup2,
                onChanged: radioEventHandler2,
                title: new Text("Chocolate"),
              ),
            if (_isTextFieldVisible)
              RadioListTile<int>(
                value: 3,
                groupValue: radioGroup2,
                onChanged: radioEventHandler2,
                title: new Text("Calabresa"),
              ),
            if (_isTextFieldVisible)
              RadioListTile<int>(
                value: 4,
                groupValue: radioGroup2,
                onChanged: radioEventHandler2,
                title: new Text("Requeijão"),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Próximo Passo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: new Text(
                            "Selecione uma Pizzaria",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PedidoClientePage()));*/
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
