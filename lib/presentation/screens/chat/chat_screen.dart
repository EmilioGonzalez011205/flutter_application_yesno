// ignore_for_file: unused_local_variable

import "package:flutter/material.dart";
import "package:flutter_application_yesno/domain/entities/message.dart";
import "package:flutter_application_yesno/presentation/providers/Chat_Provider.dart";
import "package:flutter_application_yesno/presentation/widgets/chat/my_message_bubble.dart";
import "package:flutter_application_yesno/presentation/widgets/her_message_bubble.dart";
import "package:flutter_application_yesno/presentation/widgets/shared/message_field_box.dart";
import "package:provider/provider.dart";

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
        title: Text("Mi amor ♥"),
        //centerTitle: true,
      ),
      body: _ChatView()
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Le pide que esté pendiente de cambios 
    final chatProvider = context.watch<ChatProvider>() ;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child:ListView.builder(
                //Enlaza el controlador creado en ChatProvider
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index){
                  //Instancia que sabrá de quién es el mensaje.
                  final message = chatProvider.messageList[index];
                  //Si es par, es de ella, si no, es el mío.
                  //return (index %2 == 0)
                  return (message.fromWho == FromWho.hers)
                  ?  HerMessageBubble()
                  :  MyMessageBubble(message: message,) ;
              
              })),

            ///Caja de texto de mensajes.
             MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
