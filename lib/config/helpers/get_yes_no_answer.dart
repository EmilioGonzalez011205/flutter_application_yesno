// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_application_yesno/domain/entities/message.dart';
import 'package:flutter_application_yesno/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //instancia de la clase Dio para manejar las peticiones http
  final _dio = Dio();

  Future<Message> getAnswer () async{
    //Almacena la petición http
    final response = await _dio.get('https://yesno.wtf/api');

 //Almacenar la respuesta o data de la respuesta
  final yesNoModel = YesNoModel.fromJson(response.data);

  //Retornar la instancia de Message
  return yesNoModel.toMessageEntity();
  }
}