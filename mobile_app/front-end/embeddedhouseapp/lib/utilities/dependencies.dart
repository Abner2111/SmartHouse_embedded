import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'base_url.dart';

class AuthController extends GetxController{
  final createAccountUrl = Uri.parse('$baseUrl/api/users/create-account');
  final signInUrl = Uri.parse('$baseUrl/api/users/sign-in');
  final turnLightOnUrl = Uri.parse('$baseUrl/api/house/turn-light-on');
  final turnLightOffUrl = Uri.parse('$baseUrl/api/house/turn-light-off');
  //Agregar mas funcionalidades si es necesario 

  RxBool isSignedIn = false.obs;
  RxString token = ''.obs;
  RxString signedInEmail = ''.obs;

  Future<String> createAccount(
    String email,
    String password,
  ) async {
    try {
      var createAccountData = await http.post(
        createAccountUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      if (createAccountData.statusCode == 200) {
        return 'success';
      } else {
        return createAccountData.body.toString();
      }
    } catch (error) {
      return '$error';
    }
  }

  Future<String> signIn(
    String email,
    String password,
  ) async {
    try {
      var signInData = await http.post(
        signInUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      if (signInData.statusCode == 200) {
        final jsonSignInData = jsonDecode(signInData.body);
        isSignedIn.value = true;
        token.value = jsonSignInData['token'];
        signedInEmail.value = jsonSignInData['email'];
        return 'success';
      } else {
        return signInData.body.toString();
      }
    } catch (error) {
      return '$error';
    }
  }

    Future<String> turnLightOn(
    int lightNo, 
    ) async{
      try{
        var turnOnData = await http.post(
          turnLightOnUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'action': "control_light",
            'light': lightNo,
            'value': 1
          },
         ),
        );
        if(turnOnData.statusCode == 200){
          return 'Light turned on successfully';
        }else{
          return turnOnData.body.toString();
        }
      }catch(error){
        return '$error';
      }
    }

    Future<String> turnLightOff(
    int lightNo, 
    ) async{
      try{
        var turnOffData = await http.post(
          turnLightOffUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'action': "control_light",
            'light': lightNo,
            'value': 0
          },
         ),
        );
        if(turnOffData.statusCode == 200){
          return 'Light turned off successfully';
        }else{
          return turnOffData.body.toString();
        }
      }catch(error){
        return '$error';
      }
    }

    Future<String> checkLightStatus(
    int lightNo, 
    ) async{
      try{
        var checkLightData = await http.post(
          turnLightOffUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'action': "check_light",
            'light': lightNo
          },
         ),
        );
        if(checkLightData.statusCode == 200){
          return checkLightData.body.toString();
        }
        else{
          return checkLightData.body.toString();
        }
      }catch(error){
        return '$error';
      }
    }

    Future<String> checkDoorStatus(
    int doorNo, 
    ) async{
      try{
        var checkLightData = await http.post(
          turnLightOffUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'action': "check_door",
            'light': doorNo
          },
         ),
        );
        if(checkLightData.statusCode == 200){
          return checkLightData.body.toString();
        }
        else{
          return checkLightData.body.toString();
        }
      }catch(error){
        return '$error';
      }
    }

    void signOut(){
      Get.offNamed('/home_page');
      token.value = '';
      isSignedIn.value = false;
    }
}
class InitialBindings extends Bindings{
  @override
  void dependencies(){
    Get.put<AuthController>(AuthController(),);
  }
}