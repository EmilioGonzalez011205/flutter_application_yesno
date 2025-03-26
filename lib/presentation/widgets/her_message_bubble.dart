import "package:flutter/material.dart";

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
            child: Text("Hola mi amor, como estas?", 
            style: TextStyle(color: Colors.white),
            ),
          )
        ),

        const SizedBox(height: 5),

        _ImageBubble(),

        const SizedBox(height: 10,),


        //Todo imagen

      ],
    );
    
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    print (size);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network("https://yesno.wtf/assets/yes/6-304e564038051dab8a5aa43156cdc20d.gif",
      width: size.width * 0.70,
      height: 150,
      fit: BoxFit.cover,)
      );
  }
}