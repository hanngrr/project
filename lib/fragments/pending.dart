import 'package:flutter/material.dart';

class Pending extends StatefulWidget {
  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending>{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromRGBO(255, 204, 92, 100.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Text("Pending yeeet", textAlign: TextAlign.center),
      ),
      ),
    );
  }
}