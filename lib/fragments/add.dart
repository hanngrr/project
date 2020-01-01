import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add>{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 204, 92, 100.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text("Utang way wawarts"),
      ),
    );
  }
}