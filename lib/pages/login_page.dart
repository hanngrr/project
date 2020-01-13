// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project/pages/home.dart';

// class LoginPage extends StatefulWidget{

//   @override
//   State<StatefulWidget> createState() => _LoginPageState();
//   }

//   enum FormType {
//     login,
//     register
//   }

// class _LoginPageState extends State<LoginPage>{
  
//   final formKey = GlobalKey<FormState>();

//   String _email;
//   String _password;
//   FormType _formType = FormType.login;

//   bool validateAndSave(){
//     final form = formKey.currentState;
//     if (form.validate()){
//       form.save();
//       return true;
//     } 
//     return false;
//   }

//   void validateAndSubmit() async {
//     if (validateAndSave()){
//       try{
//         if (_formType == FormType.login){
//           AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
//           Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
//         } else {
//           final FirebaseAuth _auth = FirebaseAuth.instance;
//           final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: _email, password: _password)) .user;
//           user.sendEmailVerification();
//         }
//       }
//       catch(e){
//         print("Error: $e");
//       }
//     }
//   }

//   void moveToRegister(){
//     formKey.currentState.reset();
//     setState(() {
//       _formType = FormType.register;
//     });
    
//   }

//   void moveToLogin(){
//     formKey.currentState.reset();
//     setState(() {
//       _formType = FormType.login;
//     });
//   }

//   @override 
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lendit"),
//         ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: buildInputs() + buildSubmitButtons(),
//            ),
//           ),
//         ),
//       );
//   }

//   List<Widget> buildInputs(){
//     return [
//       TextFormField(
//         decoration: InputDecoration(
//           labelText: "Email"),
//           validator: (value) => value.isEmpty ? "Email is empty!" : null,
//           onSaved: (value) => _email = value,
//         ),
//       TextFormField(
//         decoration: InputDecoration(
//           labelText: "Password"),
//           obscureText: true,
//           validator: (value) => value.isEmpty ? "Password is empty!" : null,
//           onSaved: (value) => _password = value,
//         ),
//     ];
//   }

//   List<Widget> buildSubmitButtons(){
//     if (_formType == FormType.login){
//       return[
//         RaisedButton(
//           child: Text("Login", style: TextStyle(fontSize: 20.0),),
//           onPressed: validateAndSubmit,
//         ),
//         RaisedButton(
//           child: Text("Create an account", style: TextStyle(fontSize: 20.0)),
//           onPressed: moveToRegister,
//         )
//       ];
//     } else {
//       return[
//         RaisedButton(
//           child: Text("Register", style: TextStyle(fontSize: 20.0),),
//           onPressed: validateAndSubmit,
//         ),
//         RaisedButton(
//           child: Text("Already registered? Login", style: TextStyle(fontSize: 20.0)),
//           onPressed: moveToLogin,
//         )
//       ];
//     }
//   }
// }