import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More>{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 204, 92, 100.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text("Dunno"),
      ),
    );
  }
}