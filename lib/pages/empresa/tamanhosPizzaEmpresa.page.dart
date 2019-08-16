import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

//import 'package:charts_flutter/flutter.dart' as charts;

class TamanhosPizzaEmpresaPage extends StatefulWidget {
  TamanhosPizzaEmpresaPage({this.idDocument});
  final String idDocument;

  State<StatefulWidget> createState() =>
      _TamanhosPizzaEmpresaPageState(idDocument: this.idDocument);
}

class _TamanhosPizzaEmpresaPageState extends State<TamanhosPizzaEmpresaPage> {
  _TamanhosPizzaEmpresaPageState({this.idDocument});
  String idDocument;

  var controllerLista = new MoneyMaskedTextController(leftSymbol: 'R\$ ');

  createAlertDialog(BuildContext context) {
    var valor = new MoneyMaskedTextController(
        decimalSeparator: ',', thousandSeparator: '.');

    final descricao = TextEditingController();
    final quantSabor = TextEditingController();
    final quantPess = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Cadastro",
              textAlign: TextAlign.center,
            ),
            content: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: descricao,
                  decoration: InputDecoration(
                    labelText: "Descrição",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: quantSabor,
                  decoration: InputDecoration(
                    labelText: "Quantidade Sabores",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: quantPess,
                  decoration: InputDecoration(
                    labelText: "Ideal Quant. Pessoas",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: valor,
                  decoration: InputDecoration(
                    labelText: "Valor",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  salvarTamanho(descricao, quantSabor, quantPess, valor);
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text(
                  "Fechar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  salvarTamanho(descricao, quantSabor, quantPess, valor) {
    Firestore.instance.collection("empresa_tamanho").document().setData({
      'idusuario': this.idDocument,
      'descricao': descricao.text,
      'quantidade_sabor': int.parse(quantSabor.text),
      'pessoas': int.parse(quantPess.text),
      'valor': double.parse(valor.text.replaceAll(".", "").replaceAll(",", "."))
    });
  }

  alterarTamanho(id, descricao, quantSabor, quantPess, valor) {
    Firestore.instance
        .collection("empresa_tamanho")
        .document(id)
        .updateData({
      'descricao': descricao.text,
      'quantidade_sabor': int.parse(quantSabor.text),
      'pessoas': int.parse(quantPess.text),
      'valor': double.parse(valor.text.replaceAll(".", "").replaceAll(",", "."))
    });
  }

  abrirTela(String id, descricao, quantSabor, quantPess, valor) {
    Firestore.instance
        .collection("empresa_tamanho")
        .document(id)
        .snapshots()
        .forEach((DocumentSnapshot docs) {
      if (docs.data.length != 0) {
        descricao.text = docs.data['descricao'];
        quantSabor.text = docs.data['quantidade_sabor'].toString();
        quantPess.text = docs.data['pessoas'].toString();
        var formata = docs.data['valor']
            .toString()
            .replaceAll(".09", ",09")
            .replaceAll(".08", ",08")
            .replaceAll(".07", ",07")
            .replaceAll(".06", ",06")
            .replaceAll(".05", ",05")
            .replaceAll(".04", ",04")
            .replaceAll(".03", ",03")
            .replaceAll(".02", ",02")
            .replaceAll(".01", ",01")
            .replaceAll(".0", ",00");

        valor.text = formata;
      }
    });
  }

  updateAlertDialog(BuildContext context, String id) {
    var valor = new MoneyMaskedTextController(
        decimalSeparator: ',', thousandSeparator: '.');

    final descricao = TextEditingController();
    final quantSabor = TextEditingController();
    final quantPess = TextEditingController();

    abrirTela(id, descricao, quantSabor, quantPess, valor);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Alteração",
              textAlign: TextAlign.center,
            ),
            content: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: descricao,
                  decoration: InputDecoration(
                    labelText: "Descrição",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: quantSabor,
                  decoration: InputDecoration(
                    labelText: "Quantidade Sabores",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: quantPess,
                  decoration: InputDecoration(
                    labelText: "Ideal Quant. Pessoas",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: valor,
                  decoration: InputDecoration(
                    labelText: "Valor",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  alterarTamanho(id, descricao, quantSabor, quantPess, valor);
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text(
                  "Fechar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    /* var data = [
      
      Sales("1", 1, Colors.red),
      Sales("2", 1, Colors.blue),
      Sales("3", 1, Colors.yellow),
      Sales("4", 1, Colors.pink),
    ];

    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          id: 'Sales',
          data: data,
          colorFn: (Sales sales, _) => sales.color,
          labelAccessorFn: (Sales sales, _) => '${sales.sold.toString()}')
    ];

    var chart = charts.PieChart(
      series,
      /*behaviors: [
        new charts.DatumLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: charts.BehaviorPosition.end,
          // For a legend that is positioned on the left or right of the chart,
          // setting the justification for [endDrawArea] is aligned to the
          // bottom of the chart draw area.
          outsideJustification: charts.OutsideJustification.endDrawArea,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as new rows first instead of a new column.
          horizontalFirst: false,
          // By setting this value to 2, the legend entries will grow up to two
          // rows before adding a new column.
          desiredMaxRows: 7,
          // This defines the padding around each legend entry.
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          // Render the legend entry text with custom styles.
          entryTextStyle: charts.TextStyleSpec(
              color: charts.MaterialPalette.black,
              fontFamily: 'Georgia',
              fontSize: 11),
        )
      ],*/
     /* defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [charts.ArcLabelDecorator()],
      ),*/
      animate: true,
      animationDuration: Duration(seconds: 1),
    );
    Text(
                "Gráfico Maroto",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                child: chart,
                height: 200,
              ),
    */

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('empresa_tamanho')
              .where("idusuario", isEqualTo: this.idDocument)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading ...");
            }
            return new ListView(
              children: snapshot.data.documents.map((document) {
                controllerLista.updateValue(document['valor']);
                return new Card(
                  child: new Column(
                    children: <Widget>[
                      new ListTile(
                        onTap: () {
                          updateAlertDialog(context, document.documentID);
                        },
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/icone.png",
                            color: Colors.red,
                          ),
                        ),
                        title: new Text(
                          document['descricao'] +
                              "        " +
                              controllerLista.text,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        //title: new Text("Média"),
                        subtitle: new Text("Sabores: " +
                            document['quantidade_sabor'].toString() +
                            ", ideal para " +
                            document['pessoas'].toString() +
                            " pessoas"),
                        //subtitle: new Text("Sabores: 2, Ideal para 2 pessoas"),
                      ),
                    ],
                  ),
                  //title: new Text(document['login']),
                  //subtitle: new Text(document['senha']),
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          createAlertDialog(context);
        },
      ),
    );
  }
}

/*class Sales {
  final String day;
  final int sold;
  final charts.Color color;

  Sales(this.day, this.sold, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
*/
