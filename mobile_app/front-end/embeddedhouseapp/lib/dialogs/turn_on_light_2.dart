import 'package:flutter/material.dart';


class TurnOnLight2 extends StatelessWidget{const TurnOnLight2({super.key});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: const Text(
        'Light 2 changed',
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: const Text('Ok'))
      ],
    );
  }
}