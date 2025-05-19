// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_yesno/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_application_yesno/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //sendMessage
  //Controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController(); 
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [];

  Future<void> sendMessage(String text) async{
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Añadir el nuevo mensaje a la lista
    if (text.trim().isEmpty) return ;
    messageList.add(newMessage);

    //Detectar si el usuario hizo una pregunta 
    if (text.endsWith("?")){
      herReply();
    }

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

  //Crear la respuesta del servidor (ella)
  Future <void>herReply()async {
    //Obtener el mensaje de la petición http
    final herMessage = await getYesNoAnswer.getAnswer();

    //Añadir el nuevo mensaje a la lista de mensajes
    messageList.add(herMessage);

    // Notifica a provider que algo cambio
    notifyListeners();

    //Mover el scroll hasta abajo
    moveScrollToBottom();
  }
}