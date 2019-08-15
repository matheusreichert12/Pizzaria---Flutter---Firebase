import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Cadastro: " + this.idDocument,
              textAlign: TextAlign.center,
            ),
            content: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
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
                  decoration: InputDecoration(
                    labelText: "Ideal Quant. Pessoas",
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
                onPressed: () {},
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
          stream: Firestore.instance.collection('usuarios').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading ...");
            }
            return new ListView(
              children: snapshot.data.documents.map((document) {
                return new Card(
                  child: new Column(
                    children: <Widget>[
                      new ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/icone.png",
                            color: Colors.red,
                          ),
                        ),
                        // title: new Text(document['login']),
                        title: new Text("Média"),
                        //subtitle: new Text(document['senha']),
                        subtitle: new Text("Sabores: 2, Ideal para 2 pessoas"),
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
