import 'package:flutter/material.dart';

class TurnOnLight1 extends StatelessWidget{const TurnOnLight1({super.key});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: const Text(
        'Light 1 changed',
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: const Text('Ok'))
      ],
    );
  }
}