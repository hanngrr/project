import 'package:flutter/material.dart';

class Paid extends StatefulWidget {
  @override
  _PaidState createState() => _PaidState();
}

class _PaidState extends State<Paid>{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 204, 92, 100.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text("Paid charot"),
      ),
    );
  }
}