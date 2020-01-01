// import 'package:project/fragments/home.dart';
// import 'package:project/fragments/social.dart';
// import 'package:project/fragments/settings.dart';
// import 'package:project/fragments/about.dart';
// import 'package:flutter/material.dart';

// class DrawerItem{
//   String title;
//   IconData icon;
//   DrawerItem(this.title, this.icon);
// }

// class HomePage extends StatefulWidget{
//   final drawerItems = [
//     DrawerItem("Home", Icons.home),
//     DrawerItem("Connect Account", Icons.cloud_circle),
//     DrawerItem("Settings", Icons.settings),
//     DrawerItem("About", Icons.info)
//   ];

//   @override 
//   State<StatefulWidget> createState(){
//     return HomePageState();
//   }
// }

// class HomePageState extends State<HomePage>{
//   int _selectedDrawerIndex = 0;

//   _getDrawerItemWidget(int pos){
//     switch (pos){
//       case 0:
//         return Home();
//       case 1:
//         return Social();
//       case 2:
//         return Settings();
//       case 3:
//         return About();

//       default:
//         return Text("Error");
//     }
//   }

//   _onSelectItem(int index){
//     setState(() => _selectedDrawerIndex = index);
//     Navigator.of(context).pop();
//   }

//   @override 
//   Widget build(BuildContext context){
//     var drawerOptions = <Widget>[];
//     for (var i=0; i<widget.drawerItems.length; i++){
//       var d = widget.drawerItems[i];
//       drawerOptions.add(
//         ListTile(
//           leading: Icon(d.icon),
//           title: Text(d.title),
//           selected: i == _selectedDrawerIndex,
//           onTap: () => _onSelectItem(i),
//         )
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(widget.drawerItems[_selectedDrawerIndex].title),
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text("Banana"),
//               accountEmail: Text("banana@test.com"),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Text("B"),
//                 ),
//               otherAccountsPictures: <Widget>[
//                 CircleAvatar(
//                   backgroundColor: Colors.yellow,
//                   child: Text("O"),
//                 )
//               ],
              
//               ),
//               Column(children:drawerOptions)            
//           ],
//         ),
//       ),

//       body: _getDrawerItemWidget(_selectedDrawerIndex),
//     );
//   }
// }
