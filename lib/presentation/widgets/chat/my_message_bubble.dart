import "package:flutter/material.dart";
import "package:flutter_application_yesno/domain/entities/message.dart";

class MyMessageBubble extends StatelessWidget {
  //variable de la identidad atómica Message.
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    DateTime ahora = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration:BoxDecoration(
            color: colors.primary,
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
          )
        ),

        const SizedBox(height: 5)

      ],
    );
    
  }
}