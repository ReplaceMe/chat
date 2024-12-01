//import 'package:chat/pages/map_page.dart';
import 'package:chat/pages/home_page.dart';
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

    //Icon
    // TODO: implement build
    return Drawer(
      backgroundColor: const Color(0xFF333B6B),
      child:  Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
         Column(
          children: [
            DrawerHeader(
          child:  Center(
            child: Image.asset(
              "assets/ball.png",
            //   Icons.message, color: Colors.grey.shade500,
            //   size:  40,
            //   ),
              ),
            ),
          ),


          //home list title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: const Text(
                "Карта",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: "Afacad",
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.map,
                color: Colors.white,
              ),
              onTap: (){
                Navigator.pop(context);
                
              },
            ),
          ),
          // settings list title
          // Padding(
          //   padding: const EdgeInsets.only(left: 25.0),
          //   child: ListTile(
          //     title: const Text("К А Р Т А"),
          //     leading: const Icon(Icons.map),
          //     onTap: (){
          //       Navigator.pop(context);

          //       Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyMapPage(),));
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: const Text(
                "Чаты",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: "Afacad",
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(Icons.chat, color: Colors.white,),
              onTap: (){
                Navigator.pop(context);
                
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(),));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: const Text(
                "Профиль",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: "Afacad",
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(Icons.person, color: Colors.white,),
              onTap: (){
                Navigator.pop(context);
                
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  SettingsPage(),));
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
              title: const Text(
                "Выход",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(230, 255, 38, 22),
                  fontFamily: "Afacad",
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(Icons.logout,
              color: Color.fromARGB(255, 219, 27, 14),),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}