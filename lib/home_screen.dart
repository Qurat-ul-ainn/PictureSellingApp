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
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _name="", _points ="", _earnedMoney ="", _refferalcode="";
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  dynamic data;
  @override
  void initState(){
    super.initState();
    getData();
  }

  Future<dynamic> getData() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);

    final DocumentReference document =   Firestore.instance.collection("UserInfo").document('KjF8UGk5hIyzdjfhOAZw');

    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
      setState(() {
        data =snapshot.data;
        print(data['Mobile']);
        _name = data['Name'];
        _points = data['Points'];
        _earnedMoney = data['EarnMoney'];
        _refferalcode = data['Referral Code'];
      });
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
