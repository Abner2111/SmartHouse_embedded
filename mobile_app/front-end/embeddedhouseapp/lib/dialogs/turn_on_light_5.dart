import 'package:flutter/material.dart';

class TurnOnLight5 extends StatelessWidget{const TurnOnLight5({super.key});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: const Text(
        'Light 5 changed',
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: const Text('Ok'))
      ],
    );
  }
}