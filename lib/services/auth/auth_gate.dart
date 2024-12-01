import 'package:chat/pages/map_page.dart';
import 'package:chat/services/auth/login_or_register.dart';
import 'package:chat/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if(snapshot.hasData){
            return MyMapPage();
          }else{
            return LoginOrRegister();
          }
        }
        ),
    );
  }

}