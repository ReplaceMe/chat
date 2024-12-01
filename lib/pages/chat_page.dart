import 'package:chat/components/chat_bubble.dart';
import 'package:chat/components/my_textfield.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:chat/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  final String receiveEmail;
  final String receiveID;
  final String name;

  const ChatPage({
    super.key,
    required this.name,
    required this.receiveEmail,
    required this.receiveID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    focusNode.addListener((){
      if(focusNode.hasFocus){
        Future.delayed(
          const Duration(milliseconds: 500), 
          () => scrollDown,
        );
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();

  void scrollDown(){
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, 
      duration: const Duration(seconds: 1), 
      curve: Curves.fastOutSlowIn);
  }

  void sendMessage() async {

    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(widget.receiveID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(
              child: _buildMessageList(),
            ),
            _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    
    return StreamBuilder(
      stream: _chatService.getMessages(senderID, widget.receiveID), 
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text("Error");
        }

        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading...");
        }

        return ListView(
          controller: _scrollController,
          children: 
            snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      });
  }

  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    

    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    var alignment = 
      isCurrentUser ? Alignment.bottomRight : Alignment.bottomLeft;

    DateTime date = (data['timestamp'] as Timestamp).toDate();

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,

          children: [
            ChatBubble(
              message: data["message"], 
              isCurrentUser: isCurrentUser,
            ),
            Text(date.toString()),
            
          ],
        ),
      );
  }

  Widget _buildUserInput(){
    return Row(
      children: [
        Expanded(
          child: MyTextfield(
          hintText: "Type a message", 
          obscureText: false, 
          controller: _messageController,
          focusNode: focusNode,
          )
        ),

          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage, 
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,),
              ),
          ),
      ],
    );
  }
}