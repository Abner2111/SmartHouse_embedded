import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:embeddedhouseapp/utilities/dependencies.dart' as dependencies;  

class TurnOffLight3 extends StatelessWidget{const TurnOffLight3({super.key});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: const Text(
        'Do you want to turn off light 3?',
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(
          child: const Text('Yes'),
          onPressed: () {
            Get.find<dependencies.AuthController>().turnLightOff(3);
          },
        ),
        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: const Text('Cancel'))
      ],
    );
  }
}