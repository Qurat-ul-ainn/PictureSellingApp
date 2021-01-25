import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamo/services/database_model.dart';
import 'package:streamo/login_signup/login_screen.dart';
import 'package:toast/toast.dart';
import 'components.dart';

class SignUp extends StatelessWidget {
  final _homePageController =TextEditingController();
  final _emailController =TextEditingController();
  final _phoneController = TextEditingController();
  final _passController =TextEditingController();
  final _refCodeController =TextEditingController();
  int points = 0;
  int earnedMoney=0;
  String code;

  Future<void> insertData(final userInfo) async{
    Firestore firestore = Firestore.instance;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser cuser =  await _auth.currentUser();

     print("aa $code");
     firestore.collection("UserInfo").document(code).setData(userInfo);
//         .add(userInfo)
//         .then((DocumentReference document) {
//      print(document.documentID);
//    }).catchError((e) {
//      print(e);
//    });
  }


  Future<void> updateData() async{
    Firestore firestore = Firestore.instance;
    DocumentSnapshot user = await firestore.collection("UserInfo").document(_refCodeController.text).get();
    int _earnedMoney = user.data["EarnMoney"];
    int _points = user.data["Points"];
    firestore.collection("UserInfo").document(_refCodeController.text).updateData({"EarnMoney" : _earnedMoney+20,
    "Points" : _points +20});


//         .add(userInfo)
//         .then((DocumentReference document) {
//      print(document.documentID);
//    }).catchError((e) {
//      print(e);
//    });
  }

  Future<bool> registration(String homePage ,String email, String phone,String pass,int points,String referral, BuildContext context)async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user =result.user;

      UserUpdateInfo info= UserUpdateInfo();
      info.displayName=homePage;
      code = user.uid.substring(0, 6);
      user.updateProfile(info);
      
      if(user != null) {
        Toast.show("Registered Successfully", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        final userInfo = DataCollection(
            homePage,
            email,
            phone,
            pass,
            points,
            code,
            earnedMoney);

        insertData(userInfo.toMap());
         updateData();
      }
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'HELLO! Sign Up to get started',
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
                  passHide: false,
                ),
                Component(
                  txtHint: 'Email Address',
                  txtController: _emailController,
                  passHide: false,
                ),
                Component(
                  txtHint: 'Mobile Number',
                  txtController: _phoneController,
                  passHide: false,
                ),
                Component(
                  txtHint: 'Enter 6 digit Password',
                  txtController: _passController,
                  passHide: false,
                ),
                Component(
                  txtHint: 'Referral Code',
                  txtController: _refCodeController,
                  passHide: false,
                ),
                Button(
                  btnTxt: 'Sign Up',
                  btnFunction: () async {
                    final gHomePage = _homePageController.text.toString().trim();
                    final gEmail = _emailController.text.toString().trim();
                    final gPhone = _phoneController.text.toString().trim();
                    final gPass = _passController.text.toString().trim();
                    final gReferral = _phoneController.text.toString().trim();




                    bool result = await registration(gHomePage, gEmail,gPhone, gPass,points, gReferral, context);

                    if(result){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return SignIn();
                      }));
                    }
                    else{
                      print('Error');
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
