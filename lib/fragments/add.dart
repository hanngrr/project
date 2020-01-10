import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:project/fragments/firestoreserv.dart';

class Add extends StatefulWidget {
  Add();

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String debtorName, amount, debtorContactNumber, debtorEmail;

  String dueDate = "Not set";

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

  void initState() {
    super.initState();
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
                          hasFloatingPlaceholder: true,
                          labelText: "Debtor's Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
                          hasFloatingPlaceholder: true,
                          labelText: "Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(containerHeight: 210.0),
                            showTitleActions: true,
                            minTime: DateTime(2016, 1, 1),
                            maxTime: DateTime(2050, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          dueDate =
                              '${date.year} - ${date.month} - ${date.day}';
                          setState(() {
                            getDueDate(dueDate);
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "$dueDate",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18.0),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "Change",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0),
                            )
                          ],
                        ),
                      ),
                      color: Colors.white,
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
                          hasFloatingPlaceholder: true,
                          labelText: "Debtor's Contact Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
                          hasFloatingPlaceholder: true,
                          labelText: "Debtor's Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
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
