import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/fragments/add.dart';
import 'package:project/fragments/overdue.dart';
import 'package:project/fragments/paid.dart';
import 'package:project/fragments/pending.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lendit',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Lendit",
          style: TextStyle(color: Color.fromRGBO(255, 204, 92, 100.0)),
        ),
        centerTitle: true,
      ),
      body: PageView(
        physics: ClampingScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          Pending(),
          Overdue(),
          Add(),
          Paid(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Color.fromRGBO(255, 204, 92, 100.0),
        buttonBackgroundColor: Colors.white,
        height: 50,
        index: _currentIndex,
        items: <Widget>[
          Icon(
            Icons.rotate_right,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.timelapse,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.add,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.done_all,
            size: 20,
            color: Colors.black,
          ),
        ],
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInCirc,
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
