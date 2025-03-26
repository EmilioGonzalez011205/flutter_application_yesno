import "package:flutter/material.dart";
import "package:flutter_application_yesno/presentation/widgets/chat/my_message_bubble.dart";
import "package:flutter_application_yesno/presentation/widgets/her_message_bubble.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(1.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/1a/27/94/1a2794f82559744a55fc23ad86c037d4.jpg"),
            )
          ),
        title: Text("<--- El amor de mi vida "),
        centerTitle: true,
      ),
      body: _ChatView()
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child:ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index){
                  return (index %2 ==0)
                  ? const HerMessageBubble()
                  : const MyMessageBubble() ;
              
              })),

            Text("Rocio"),
          ],
        ),
      ),
    );
  }
}
