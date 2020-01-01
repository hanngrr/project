import 'package:flutter/material.dart';

class Overdue extends StatefulWidget {
  @override
  _OverdueState createState() => _OverdueState();
}

class _OverdueState extends State<Overdue>{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 204, 92, 100.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text("Singli na yeeet", textAlign: TextAlign.center),
        
      ),
    );
  }
}