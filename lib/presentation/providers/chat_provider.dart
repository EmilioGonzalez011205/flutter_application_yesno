// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_yesno/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //sendMessage 
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
    messageList.add(newMessage);
    //Notifica a provider que algo cambio
    notifyListeners();
  }
}