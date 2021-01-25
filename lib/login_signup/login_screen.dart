import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streamo/home_screen.dart';
import 'components.dart';
import 'signup_screen.dart';

class SignIn extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future<FirebaseUser> ifRegister(String email, String pass) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60),
                  Text(
                    'HELLO AGAIN! WELCOME BACK',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Component(
                    txtHint: 'Email Address',
                    txtController: _emailController,
                    passHide: false,
                  ),
                  Component(
                    txtHint: 'Password',
                    txtController: _passController,
                    passHide: true,
                  ),
                  Button(
                    btnTxt: 'Sign In',
                    btnFunction: () async {
                      final email = _emailController.text.toString().trim();
                      final pass = _passController.text.toString().trim();

                      FirebaseUser user = await ifRegister(email, pass);

                      if (user != null) {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) {
                          return HomePage(

                          );
                        }));
                      } else {
                        print('null');
                      }
                    },
                  ),
                  FltButton(
                    btnFunction: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return SignUp();
                        }),
                      );
                    },
                    btnTxt: 'Sign Up',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
