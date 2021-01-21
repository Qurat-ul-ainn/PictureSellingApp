import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamo/login_signup/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {


 // const HomePage({Key key, this.userInfo});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 Firestore _firestore = Firestore.instance;
 FirebaseAuth _auth = FirebaseAuth.instance;
 String _name="",  _refferalcode="";
 int _points, _earnedMoney;


 getUser() async {
   FirebaseUser cuser =  await _auth.currentUser();

   DocumentSnapshot user = await _firestore.collection("UserInfo").document(cuser.uid).get();
   print(user.data);
   setState(() {
     _name = user.data["Name"];
     _points = user.data["Points"];
     _earnedMoney = user.data["EarnMoney"];
     _refferalcode = user.data["Referral Code"];
   });
 }

 @override
  void initState() {
   getUser();
   // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'STREAMO',
          style: TextStyle(color: Colors.white,
          fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(

            children: <Widget>[
              Text(
                _name,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Text(
                "Your Points: $_points",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 20,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.blue[900],
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 95,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[900],
                      radius: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You Earned",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 20.0,),
                          Text("$_earnedMoney",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0,),
              TextComponent(
                text: "Refferal Code: $_refferalcode",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
