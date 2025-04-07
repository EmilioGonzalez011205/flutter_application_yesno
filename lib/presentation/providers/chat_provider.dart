import 'package:flutter/material.dart';
import 'package:flutter_application_yesno/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola Salazar", fromWho: FromWho.me),
    Message(text: "Por haberte ido, te vas a especial directo", fromWho: FromWho.hers),
  ];
}