import 'package:embeddedhouseapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'utilities/theme.dart';
import 'package:get/get.dart';
import 'utilities/dependencies.dart' as dependencies;
import 'utilities/routes.dart' as routes;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Embedded House App',
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: dependencies.InitialBindings(),
      getPages: routes.getPages,
      home: const HomePage(),
   );
  }
}

