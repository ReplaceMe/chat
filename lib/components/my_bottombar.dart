
//import 'package:chat/pages/map_page.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/map_page.dart';
import 'package:chat/pages/settings_page.dart';
import 'package:chat/services/auth/auth_service.dart';
//import 'package:chat/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget{
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {

    //Icon
    // TODO: implement build
    return BottomAppBar(
      
      color: Color(0xFF333B6B),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
              color: Color(0xFFe2642C),
              borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              alignment: Alignment.center,
              child: Image.asset("assets/icons/ic_chats.png"),
            ),

            onTap: (){
              Navigator.pop(context);
                
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(),));
            },
          ),

           GestureDetector(
            child: 
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFe2642C),
                  borderRadius: BorderRadius.circular(12),
              ),

              padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              alignment: Alignment.center,
              child: Image.asset("assets/icons/ic_map.png"),
            ),
            onTap: (){
              Navigator.pop(context);
                
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyMapPage(),));
            },
          ),

           GestureDetector(
            child: Container(
              decoration: BoxDecoration(
              color: Color(0xFFe2642C),
              borderRadius: BorderRadius.circular(20),
              ),

              padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              alignment: Alignment.center,
              child: Image.asset("assets/icons/ic_profile.png"),
            ),

            onTap: (){
              Navigator.pop(context);
                
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  SettingsPage(),));
            },
          ),
        ],
      ),
    );
  }
}