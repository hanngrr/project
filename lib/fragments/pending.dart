import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/fragments/firestoreserv.dart';
import 'package:project/fragments/list.dart';

class Pending extends StatefulWidget {
  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  List<PendingList> lists;
  FirestoreServ fireServ = FirestoreServ();
  StreamSubscription<QuerySnapshot> pendingList;

  @override
  void initState() {
    super.initState();
    lists = List();

    pendingList?.cancel();
    pendingList = fireServ.getPendingList().listen((QuerySnapshot snapshot) {
      final List<PendingList> debtors = snapshot.documents
          .map((documentSnapshot) => PendingList.fromMap(documentSnapshot.data))
          .toList();

      setState(() {
        this.lists = debtors;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(255, 204, 92, 100.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: lists.length,
                  itemBuilder: (context, index) {
                    return Stack(children: <Widget>[
                      Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80.0,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
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
                                          '${lists[index].debtorName}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${lists[index].amount}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '${lists[index].dueDate}',
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
