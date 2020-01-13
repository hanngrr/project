import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Paid extends StatefulWidget {
  @override
  _PaidState createState() => _PaidState();
}

class _PaidState extends State<Paid>{
  Firestore db = Firestore.instance;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                color: Color.fromRGBO(255, 204, 92, 100.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder(
                  stream: db.collection("add").where("status", isEqualTo: false).snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return Stack(children: <Widget>[
                        Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100.0,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 8.0),
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5.0,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '${snapshot.data.documents[index]["debtorName"]}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                '${snapshot.data.documents[index]["amount"]}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '${snapshot.data.documents[index]["dueDate"]}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ]);
                    });
                  },
                ),
                ),
          ],
        ),
      ),
    );
  }
}