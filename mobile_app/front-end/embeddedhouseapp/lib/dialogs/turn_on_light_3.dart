import 'package:flutter/material.dart';

class TurnOnLight3 extends StatelessWidget{const TurnOnLight3({super.key});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: const Text(
        'Light 3 changed',
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: const Text('Ok'))
      ],
    );
  }
}