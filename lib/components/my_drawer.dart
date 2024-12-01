//import 'package:chat/pages/map_page.dart';
import 'package:chat/pages/map_page.dart';
import 'package:chat/pages/settings_page.dart';
import 'package:chat/services/auth/auth_service.dart';
//import 'package:chat/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  void logout(){
  final _auth = AuthService();
  _auth.signOut();
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
         Column(
          children: [
            DrawerHeader(
          child:  Center(
            child: Icon(
              Icons.message, color: Colors.grey.shade500,
              size:  40,
              ),
            ),
          ),


          //home list title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          // settings list title
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("M A P"),
              leading: const Icon(Icons.map),
              onTap: (){
                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyMapPage(),));
              },
            ),
          ),

          //Padding(
            //padding: const EdgeInsets.only(left: 25.0),
           // child: ListTile(
              //title: const Text("M A P"),
             // leading: const Icon(Icons.map),
             // onTap: (){
              //  Navigator.pop(context);

              //  Navigator.push(context, MaterialPageRoute(builder: (context) => const MapPage(),));
             // },
           // ),
          //),

          ],
         ),

         
          //logout list title
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}