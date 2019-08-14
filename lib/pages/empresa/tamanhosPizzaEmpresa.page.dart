import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
    var data = [
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
      behaviors: [
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
      ],
     /* defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [charts.ArcLabelDecorator()],
      ),*/
      animate: true,
      animationDuration: Duration(seconds: 1),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Charts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Text(
                "Gráfico Maroto",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                child: chart,
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Tamanho da pizza",
                style: TextStyle(fontSize: 16),
              ),
              DropdownButton<String>(
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
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                //controller: n,
                decoration: InputDecoration(
                  hintText: "Quantidade de Fatias",
                  icon: Icon(Icons.local_pizza),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sales {
  final String day;
  final int sold;
  final charts.Color color;

  Sales(this.day, this.sold, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
