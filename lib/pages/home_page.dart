import 'package:chat/components/my_drawer.dart';
import 'package:chat/components/user_tile.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:chat/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ч А Т Ы"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      //drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(), 
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text("Error");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading");
        }
        
        return ListView(
          children: 
            snapshot.data!
            .map<Widget>((userData) => _buildUserListItem(userData, context))
            .toList(),
          
        );
      },
      );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
    if(userData["uid"] != _authService.getCurrentUser()!.uid){
      return UserTile(
        text: userData["name"],
        onTap: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiveEmail: userData["email"],
                receiveID: userData["uid"],
                name: userData["name"],
              ),
            ),
          ); 
        },
      );
    }
    else{
      return Container(

      );
    }
  }

}