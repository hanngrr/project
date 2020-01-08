import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  Add();

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String debtorName, amount, dueDate, debtorContactNumber, debtorEmail;

  getDebtorName(debtorName) {
    this.debtorName = debtorName;
  }

  getAmount(amount) {
    this.amount = amount;
  }

  getDueDate(dueDate) {
    this.dueDate = dueDate;
  }

  getDebtorContactNumber(debtorContactNumber) {
    this.debtorContactNumber = debtorContactNumber;
  }

  getDebtorEmail(debtorEmail) {
    this.debtorEmail = debtorEmail;
  }

  createData() {
    DocumentReference ds =
        Firestore.instance.collection('add').document(debtorName);
    Map<String, dynamic> debtors = {
      "debtorName": debtorName,
      "amount": amount,
      "dueDate": dueDate,
      "debtorContactNumber": debtorContactNumber,
      "debtorEmail": debtorEmail,
    };
    ds.setData(debtors).whenComplete(() {
      print("Successfully Added!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(255, 204, 92, 100.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: TextFormField(
                      onChanged: (String debtorName) {
                        getDebtorName(debtorName);
                      },
                      decoration: InputDecoration(
                          labelText: "Debtor's Name",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: TextFormField(
                      onChanged: (String amount) {
                        getAmount(amount);
                      },
                      decoration: InputDecoration(
                          labelText: "Amount",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Due Date',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                      onChanged: (String dueDate) {
                        getDueDate(dueDate);
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: TextFormField(
                      onChanged: (String debtorContactNumber) {
                        getDebtorContactNumber(debtorContactNumber);
                      },
                      decoration: InputDecoration(
                          labelText: "Debtor's Contact Number",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: TextFormField(
                      onChanged: (String debtorEmail) {
                        getDebtorEmail(debtorEmail);
                      },
                      decoration: InputDecoration(
                          labelText: "Debtor's Email",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          createData();
                          print("Succesfully Added");
                        },
                        child: const Text("Save",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
