import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamo/services/database_model.dart';
import 'package:streamo/login_signup/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components.dart';

class SignUp extends StatelessWidget {
  final _homePageController =TextEditingController();
  final _emailController =TextEditingController();
  final _phoneController = TextEditingController();
  final _passController =TextEditingController();
  final _refCodeController =TextEditingController();
  String points = '0';
  String earnedMoney='0';



  Future<void> insertData(final userInfo) async{
    Firestore firestore = Firestore.instance;

    firestore.collection("UserInfo").add(userInfo)
        .then((DocumentReference document) {
      print(document.documentID);
    }).catchError((e) {
      print(e);
    });
  }

  Future<bool> registration(String homePage ,String email, String phone,String pass,String points,String referral)async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user =result.user;

      UserUpdateInfo info= UserUpdateInfo();
      info.displayName=homePage;
      user.updateProfile(info);


      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  'HELO!\nSignup to\nget started',
                  textAlign: TextAlign.left,
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
                  txtHint: 'Name',
                  txtController: _homePageController,
                ),
                Component(
                  txtHint: 'Email Address',
                  txtController: _emailController,
                ),
                Component(
                  txtHint: 'Mobile Number',
                  txtController: _phoneController,
                ),
                Component(
                  txtHint: 'Password',
                  txtController: _passController,
                ),
                Component(
                  txtHint: 'Referral Code',
                  txtController: _refCodeController,
                ),
                Button(
                  btnTxt: 'Sign Up',
                  btnFunction: () async {
                    final gHomePage = _homePageController.text.toString().trim();
                    final gEmail = _emailController.text.toString().trim();
                    final gPhone = _phoneController.text.toString().trim();
                    final gPass = _passController.text.toString().trim();
                    final gReferral = _phoneController.text.toString().trim();


                    final userInfo =DataCollection(gHomePage, gEmail,gPhone, gPass,gReferral,points,earnedMoney);
                    insertData(userInfo.toMap());
                    bool gResult = await registration(gHomePage, gEmail,gPhone, gPass,gReferral,points);

                    if(gResult){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return SignIn();
                      }));
                    }
                    else{
                      print('Not register please sign up first');
                    }
                  },
                ),
                FltButton(
                  btnFunction: (){
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SignIn();
                      }),
                    );
                  },
                  btnTxt: 'Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
