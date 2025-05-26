import 'package:flutter_application_yesno/domain/entities/message.dart';
import 'dart:math';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;
  final Random _random = Random();

  static const List<String> positiveResponses = [
    '¡Sí!',
    'Por supuesto',
    'Afirmativo',
    'Claro que sí',
    'Sin duda',
    'Positivo',
    'Definitivamente',
    'Absolutamente'
  ];

  static const List<String> negativeResponses = [
    'No',
    'Negativo',
    'Para nada',
    'Nop',
    'Ni lo sueñes',
    'De ninguna manera',
    'Imposible',
    'No creo'
  ];

  static const List<String> neutralResponses = [
    'Quizás',
    'No estoy seguro',
    'Puede ser',
    'Tal vez',
    'No tengo una respuesta clara',
    'Depende'
  ];

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() => Message(
        text: _generateRandomResponse(),
        fromWho: FromWho.hers,
        imageUrl: image,
      );

  String _generateRandomResponse() {
    if (forced) {
      return answer == "yes" ? "Sí" : "No";
    }

    if (answer == "yes") {
      return positiveResponses[_random.nextInt(positiveResponses.length)];
    } else if (answer == "no") {
      return negativeResponses[_random.nextInt(negativeResponses.length)];
    } else {
      return neutralResponses[_random.nextInt(neutralResponses.length)];
    }
  }
}