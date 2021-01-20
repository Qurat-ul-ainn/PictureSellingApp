import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Component extends StatelessWidget {

  final String txtHint;
  final txtController;

  const Component({Key key, this.txtHint,this.txtController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:8.0),
      height: 42,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500].withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        controller: txtController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20.0),
          hintText: txtHint,
          border: InputBorder.none,

          hintStyle: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}

//Class For Button
class Button extends StatelessWidget {
  final String btnTxt;
  final Function btnFunction;

  const Button({
    Key key,
    this.btnTxt,
    this.btnFunction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical:8.0),
      height: 42,
      width: double.infinity,
      child: FlatButton(
        onPressed: btnFunction,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
        color: Colors.blue[900],
        child: Text(
          btnTxt,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//navigate button
class FltButton extends StatelessWidget {
  final String btnTxt;
  final Function btnFunction;

  const FltButton({Key key, this.btnTxt, this.btnFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child:  FlatButton(
        onPressed: btnFunction,
        child: Text(
          btnTxt,
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 15
          ),
        ),
      ),
    );
  }
}

//Text Component
class TextComponent extends StatelessWidget {
  final  text;

  const TextComponent({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical:8.0),
      height: 42,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(8.0),

      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


