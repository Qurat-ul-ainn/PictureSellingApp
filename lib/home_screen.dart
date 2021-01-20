import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamo/login_signup/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  final String userInfo ;

  const HomePage({Key key, this.userInfo});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 Firestore _firestore = Firestore.instance;
 FirebaseAuth _auth = FirebaseAuth.instance;
 String _name="", _points ="", _earnedMoney ="", _refferalcode="";


 getUser() async {
   FirebaseUser cuser =  await _auth.currentUser();
   DocumentSnapshot user = await _firestore.collection("userInfo").document(cuser.uid).get();

   setState(() {
     _name = user.data["Name"];
     _points = user.data["Points"];
     _earnedMoney = user.data["Earned"];
     _refferalcode = user.data["ReferralCode"];
   });
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _name,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              Text(
                _points
              ),
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
                      child: Text(_earnedMoney,style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ),
              TextComponent(
                text: _refferalcode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
