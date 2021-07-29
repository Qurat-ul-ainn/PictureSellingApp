import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 380,
        height: 50,
        child: Center(
          child: Text('English',
            style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red[400],Colors.orange[200]]
            ),
            borderRadius: BorderRadius.circular(50)
        ),
      ),
      onTap: ()
      {
        debugPrint('hello english');
      },
    );
  }
}

