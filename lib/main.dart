import 'package:flutter/material.dart';
//import 'package:streamo/home_screen.dart';
import 'login_signup/login_screen.dart';
//import 'login_signup/signup_screen.dart';

void main() {
runApp(MaterialApp(
 home:SignIn()
));
}










/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamo/home_screen.dart';
import 'package:streamo/login_signup/login_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var email =sharedPreferences.getString('Email');
  var password =sharedPreferences.getString('Password');
  runApp(MaterialApp(
     debugShowCheckedModeBanner: false,

    home: email==null && password == null ?SignIn():HomePage()
  )
  );


}*/



