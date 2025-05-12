// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_yesno/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //sendMessage
  //Controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController(); 
  List<Message> messageList = [
    Message(text: "Hola Salazar", fromWho: FromWho.me),
    Message(text: "Por haberte ido, te vas a especial directo", fromWho: FromWho.hers),
    Message(text: "Por haberte ido, te vas a especial directo", fromWho: FromWho.hers),
    Message(text: "Por haberte ido, te vas a especial directo", fromWho: FromWho.hers),
    Message(text: "Por haberte ido, te vas a especial directo", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Añadir el nuevo mensaje a la lista
    if (text.trim().isEmpty) return ;
    messageList.add(newMessage);
    print("Cantidad de mensajes: ${messageList.length}");
    //Notifica a provider que algo cambio
    notifyListeners();
    moveScrollToBottom();
  }
  //  Mover el scroll hasta abajo
  Future <void>moveScrollToBottom() async{
    //Animación
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      //offset: Posición del máximo scroll posible
      chatScrollController.position.maxScrollExtent,
      //Duración de la animación
      duration: const Duration(milliseconds: 300), 
      //Rebote al final de la animación
      curve: Curves.easeInOut);
  }
}