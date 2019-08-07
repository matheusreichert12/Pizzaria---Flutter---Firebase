import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          //Add padding around textfield
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter Username",
              //add icon outside input field
              icon: Icon(Icons.person),
              //add icon to the beginning of text field
              //prefixIcon: Icon(Icons.person),
              //can also add icon to the end of the textfiled
              //suffixIcon: Icon(Icons.remove_red_eye),
            ),
          ),
        ),
      ),
    );
  }
}
