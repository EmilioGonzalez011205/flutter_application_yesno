// ignore_for_file: avoid_print, unused_element_parameter, sort_child_properties_last, prefer_interpolation_to_compose_strings, must_be_immutable

import "package:flutter/material.dart";
import "package:flutter_application_yesno/domain/entities/message.dart";

class HerMessageBubble extends StatelessWidget {
  final Message message;
  DateTime ahora = DateTime.now();
     HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          decoration:BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    Text('Enviado: ${ahora.hour}:${ahora.minute}', style: TextStyle(color: Colors.blue),),
                    const SizedBox(width: 10,),
                    Icon(Icons.done_all_outlined, color: Colors.white, size: 20,),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5),

        _ImageBubble(
          //Signo de admiración garantiza que siempre va a devolver una imagen
          imageUrl: message.imageUrl!,),

        const SizedBox(height: 5,),
      ],
    );
    
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    print (size);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,
      width: size.width * 0.70,
      height: 250,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {

        if (loadingProgress == null) return child;

        return Container (
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text("Mi amor está enviando una foto...")
        );

      } ,      
      ));
  }
}