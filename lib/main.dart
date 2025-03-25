import 'package:flutter/material.dart';
import 'package:flutter_application_yesno/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: Apptheme(selectedColor: 1).theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () {}, 
            child: const Text ("Click to me")),
        ),
      ),
    );
  }
}