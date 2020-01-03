import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Add extends StatefulWidget {
  Add();
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add>{
  String debtorName, amount, dueDate, debtorContactNumber, debtorEmail;
  
  TextEditingController _textFieldController = TextEditingController();

  getDebtorName(debtorName){
    this.debtorName=debtorName;
  }

  getAmount(amount){
    this.amount=amount;
  }

  getDueDate(dueDate){
    this.dueDate=dueDate;
  }

  getDebtorContactNumber(debtorContactNumber){
    this.debtorContactNumber=debtorContactNumber;
  }

  getDebtorEmail(debtorEmail){
    this.debtorEmail=debtorEmail;
  }

  createData(){
    DocumentReference ds=Firestore.instance.collection('add').document(debtorName);
    Map<String, dynamic> debtors={
      "debtorName": debtorName,
      "amount": amount,
      "dueDate": dueDate,
      "debtorContactNumber": debtorContactNumber,
      "debtorEmail": debtorEmail,
    };
    ds.setData(debtors).whenComplete((){
      print("Successfully Added!");
    });
  }

  _onClear(){
    setState(() {
      _textFieldController.text = "";
    });
  }  

  @override 
  Widget build(BuildContext context)
  {
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
                      padding: EdgeInsets.only(left: 16.0, right:16.0),
                      child: TextField(
                        onChanged: (String debtorName){
                          getDebtorName(debtorName);
                        },
                        decoration: InputDecoration(labelText: "Debtor's Name"),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right:16.0),
                      child: TextField(
                        onChanged: (String amount){
                          getAmount(amount);
                        },
                        decoration: InputDecoration(labelText: "Amount"),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right:16.0),
                      child: TextField(
                        onChanged: (String dueDate){
                          getDueDate(dueDate);
                        },
                        decoration: InputDecoration(labelText: "Due date"),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right:16.0),
                      child: TextField(
                        onChanged: (String debtorContactNumber){
                          getDebtorContactNumber(debtorContactNumber);
                        },
                        decoration: InputDecoration(labelText: "Debtor's Contact Number"),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right:16.0),
                      child: TextField(
                        onChanged: (String debtorEmail){
                          getDebtorEmail(debtorEmail);
                        },
                        decoration: InputDecoration(labelText: "Debtor's Email"),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.white,
                          onPressed: (){
                            _onClear();
                          },
                          child: const Text("Clear", style: TextStyle(color: Colors.black)),
                        ),
                        RaisedButton(
                          color: Colors.white,
                          onPressed: (){
                            createData();
                          },
                          child: const Text("Save", style: TextStyle(color: Colors.black)),
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
