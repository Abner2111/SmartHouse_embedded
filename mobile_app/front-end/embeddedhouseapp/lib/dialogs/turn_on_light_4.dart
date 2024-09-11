import 'package:flutter/material.dart';

class TurnOnLight4 extends StatelessWidget{const TurnOnLight4({super.key});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: const Text(
        'Light 4 changed',
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: const Text('Ok'))
      ],
    );
  }
}