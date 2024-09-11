import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:embeddedhouseapp/utilities/dependencies.dart' as dependencies;  

class TurnOffLight4 extends StatelessWidget{const TurnOffLight4({super.key});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: const Text(
        'Do you want to turn off light 4?',
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(
          child: const Text('Yes'),
          onPressed: () {
            Get.find<dependencies.AuthController>().turnLightOff(4);
          },
        ),
        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: const Text('Cancel'))
      ],
    );
  }
}