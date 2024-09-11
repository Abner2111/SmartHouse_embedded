import 'dart:typed_data';

import 'package:embeddedhouseapp/dialogs/sign_out_dialog.dart';
import 'package:embeddedhouseapp/dialogs/turn_on_light_1.dart';
import 'package:embeddedhouseapp/dialogs/turn_on_light_2.dart';
import 'package:embeddedhouseapp/dialogs/turn_on_light_3.dart';
import 'package:embeddedhouseapp/dialogs/turn_on_light_4.dart';
import 'package:embeddedhouseapp/dialogs/turn_on_light_5.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:embeddedhouseapp/pages/doors_page.dart';
//import 'package:embeddedhouseapp/pages/camera_page.dart';
import 'package:embeddedhouseapp/utilities/dependencies.dart' as dependencies;

import 'package:image/image.dart' as img;

class LightsPage extends StatefulWidget{
  const LightsPage({super.key});

  @override
  State<LightsPage> createState() => _LightsPageState();
}

class _LightsPageState extends State<LightsPage>{
  var scrollController = ScrollController();
  void scrollToBottom(){
    scrollController.jumpTo(scrollController.position.maxScrollExtent);

  
  }
  List<AssetImage> assetImages = [
    const AssetImage('images/light-bulb-14.png'),
    const AssetImage('images/light-bulb-on.png'),
  ]; 

  List<AssetImage> doorImage = [
    const AssetImage('images/door.png'),
  ]; 

  int currImage1 = 0;
  int currImage2 = 0;
  int currImage3 = 0;
  int currImage4 = 0;
  int currImage5 = 0;

  @override
  Widget build(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback(
      (_){
        if(!Get.find<dependencies.AuthController>().isSignedIn.value){
          Get.toNamed('/home_page');
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: const SizedBox.shrink(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              child: const Row(
                children: [
                  Text('Sign Out'),
                  SizedBox(width: 10),
                  Icon(Icons.logout),
                ],
              ),
              onTap: (){
                showDialog(
                  context:context,
                  builder: (context){
                    return const SignOutDialog();
                  },
                );
              },
            ),
          ),
        ],
        title: Center(
          child: Text(Get.find<dependencies.AuthController>().signedInEmail.value)
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 1,
                colors: [
                  Colors.white,
                  Color(0xff5debd7),
                  Colors.white,
                ],
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 5, // Number of buttons per row
            padding: const EdgeInsets.all(20),
            children: [
              GestureDetector(
                child: Image(
                  image: assetImages[currImage1],
                  width: 50,
                  height: 50,
                
                ),
                onTap: (){
                  if(currImage1 == 0){
                    setState(() {
                      currImage1++;
                      if(currImage1 > 1){
                        currImage1 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage1 = 1;
                        Get.find<dependencies.AuthController>().turnLightOn(1);
                        return const TurnOnLight1();
                      },
                    );
                  }else{
                    setState(() {
                      currImage1++;
                      if(currImage1 > 1){
                        currImage1 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage1 = 0;
                        Get.find<dependencies.AuthController>().turnLightOff(1);
                        return const TurnOnLight1();
                      },
                    );
                  }
                },
              ),
              GestureDetector(
                child: Image(
                  image: assetImages[currImage2],
                  width: 50,
                  height: 50,
                ),
                onTap: (){
                  if(currImage2 == 0){
                    setState(() {
                      currImage2++;
                      if(currImage2 > 1){
                        currImage2 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage2 = 1;
                        Get.find<dependencies.AuthController>().turnLightOn(2);
                        return const TurnOnLight2();
                      },
                    );
                  }else{
                    setState(() {
                      currImage2++;
                      if(currImage2 > 1){
                        currImage2 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage2 = 0;
                        Get.find<dependencies.AuthController>().turnLightOff(2);
                        return const TurnOnLight2();
                      },
                    );
                  }
                },
              ),
              GestureDetector(
                child: Image(
                  image: assetImages[currImage3],
                  width: 50,
                  height: 50,
                ),
                onTap: (){
                  if(currImage3 == 0){
                    setState(() {
                      currImage3++;
                      if(currImage3 > 1){
                        currImage3 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage3 = 1;
                        Get.find<dependencies.AuthController>().turnLightOn(3);
                        return const TurnOnLight3();
                      },
                    );
                  }else{
                    setState(() {
                      currImage3++;
                      if(currImage3 > 1){
                        currImage3 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage3 = 0;
                        Get.find<dependencies.AuthController>().turnLightOff(3);
                        return const TurnOnLight3();
                      },
                    );
                  }
                },
              ),
              GestureDetector(
                child: Image(
                  image: assetImages[currImage4],
                  width: 50,
                  height: 50,
                ),
                onTap: (){
                  if(currImage4 == 0){
                    setState(() {
                      currImage4++;
                      if(currImage4 > 1){
                        currImage4 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage4 = 1;
                        Get.find<dependencies.AuthController>().turnLightOn(4);
                        return const TurnOnLight4();
                      },
                    );
                  }else{
                    setState(() {
                      currImage4++;
                      if(currImage4 > 1){
                        currImage4 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage4 = 0;
                        Get.find<dependencies.AuthController>().turnLightOff(4);
                        return const TurnOnLight4();
                      },
                    );
                  }
                },
              ),
              GestureDetector(
                child: Image(
                  image: assetImages[currImage5],
                  width: 50,
                  height: 50,
                ),
                onTap: (){
                  if(currImage5 == 0){
                    setState(() {
                      currImage5++;
                      if(currImage5 > 1){
                        currImage5 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage5 = 1;
                        Get.find<dependencies.AuthController>().turnLightOn(5);
                        return const TurnOnLight5();
                      },
                    );
                  }else{
                    setState(() {
                      currImage5++;
                      if(currImage5 > 1){
                        currImage5 = 0;
                      }
                    });
                    showDialog(
                      context: context,
                      builder: (context){
                        currImage5 = 0;
                        Get.find<dependencies.AuthController>().turnLightOff(5);
                        return const TurnOnLight5();
                      },
                    );
                  }
                },
              ),
              const Text('Outdoor', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              const Text('Livingroom', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              const Text('Kitchen', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              const Text('Bedroom 1', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              const Text('Bedroom 2', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
            
              GestureDetector(
                child: Image(
                  image: doorImage[0],
                  width: 50,
                  height: 50,
                ),
                onTap: () async {
                  var doorStatus = await Get.find<dependencies.AuthController>().checkDoorStatus(1);
                  if(doorStatus == '0'){
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Door Status'),
                          content: const Text('The door is open'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Door Status'),
                          content: const Text('The door is closed'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              GestureDetector(
                child: Image(
                  image: doorImage[0],
                  width: 50,
                  height: 50,
                ),
                onTap: ()async {
                  var doorStatus = await Get.find<dependencies.AuthController>().checkDoorStatus(2);
                  if(doorStatus == '0'){
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Door Status'),
                          content: const Text('The door is open'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Door Status'),
                          content: const Text('The door is closed'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              GestureDetector(
                child: Image(
                  image: doorImage[0],
                  width: 50,
                  height: 50,
                ),
                onTap: ()async {
                  var doorStatus = await Get.find<dependencies.AuthController>().checkDoorStatus(3);
                  if(doorStatus == '0'){
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Door Status'),
                          content: const Text('The door is open'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Door Status'),
                          content: const Text('The door is closed'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              GestureDetector(
                child: Image(
                  image: doorImage[0],
                  width: 50,
                  height: 50,
                ),
                onTap: ()async {
                  var doorStatus = await Get.find<dependencies.AuthController>().checkDoorStatus(4);
                  if(doorStatus == '0'){
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Door Status'),
                          content: const Text('The door is open'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text('Door Status'),
                          content: const Text('The door is closed'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              GestureDetector(
                child: Image(
                  image: doorImage[0],
                  width: 50,
                  height: 50,
                ),
                onTap: (){
                  //AGREGAR DIALOGO PARA ESTADO DE PUERTAS
                },
              ),
              const Text('Patio', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              const Text('Frontdoor', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              const Text('Bedroom 1', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              const Text('Bedroom 2', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              const Text('Dummy', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              ElevatedButton.icon(
                onPressed: () async {
                  var image_cam = await Get.find<dependencies.AuthController>().takePicture();
                  print(image_cam);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Image'),
                        content: image_cam.statusCode == 200
                            ? Image.memory(
                                Uint8List.fromList(
                                img.encodeJpg(
                                  img.decodeImage(image_cam.bodyBytes) ?? img.Image(1, 1),
                                ),)
                                
                              )
                            : const Text('Failed to retrieve image'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take picture'),
              ),
            ],
            
          ),
        ],
      
      )
    );

  }
}