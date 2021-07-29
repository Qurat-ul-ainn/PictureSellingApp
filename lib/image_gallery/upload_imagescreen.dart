import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:streamo/image_gallery/gallery_imagesscreen.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File sampleImage;
  String _title;
  String _price;
  String _description;
  String image;


  final formKey = new GlobalKey<FormState>();

//Getting Image Function from user gallery
    Future getImage() async {
      var pickedImage = await ImagePicker().getImage(
          source:  ImageSource.gallery,);
      setState(() {
        if (pickedImage != null) {
          sampleImage = File(pickedImage.path);
        } else {
          print('No image selected.');
        }
      });
    }

//button for validate and save new product
  bool validateAndSave(){
      final form = formKey.currentState;
      if(form.validate()){
        form.save();
        return true;
      }
      else{
        return false;
      }
  }

  //method for uploading new image
  void uploadNewProductImage()async{
      if(validateAndSave()){
        final StorageReference productImageRef =FirebaseStorage.instance.ref().child("Posted Products Images");

        var timeKey = DateTime.now();

        final StorageUploadTask uploadTask = productImageRef.child(timeKey.toString()+ ".jpg").putFile(sampleImage);
        var getImageUrl=await (await uploadTask.onComplete).ref.getDownloadURL();
        image=getImageUrl.toString();
        print('Image url ='+ image);

        goToImageGallery();
        savedToDatabase(image);
      }
  }

  //function for image url save to database
  void savedToDatabase(image){
      var dbTimeKey=new DateTime.now();
      var formatDate=new DateFormat('MMM d,yyyy');
      var formatTime=new DateFormat('EEEE hh:mm aaa');

      String date=formatDate.format(dbTimeKey);
      String time=formatTime.format(dbTimeKey);

      DatabaseReference  databaseReferenceref = FirebaseDatabase.instance.reference();

      var dataAboutProduct ={
        "image":image,
        "title":_title,
        "price":_price,
        "description":_description,
        "date":date,
        "time":time,

      };
      databaseReferenceref.child("Posted Products Images").push().set(dataAboutProduct);


  }

//Go To image  Gallery back
  void goToImageGallery(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ImageGallery();
      }));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text('Upload Image',),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: sampleImage==null?Text('Select an Image'):enableUpload(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

//
  Widget enableUpload(){
    return Container(
      child: new Form(
          key: formKey,
          child: Column(children: [
            Image.file(sampleImage,height: 330.0,width: 660,),
            SizedBox(height: 15.0,),
            TextFormField(
              decoration: new InputDecoration(labelText: 'Title',),
              validator: (value){
                return value.isEmpty?'Give a tittle to your Image':null;
              },
              onSaved: (value){
                return _title =value;
              },
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: 'Price',),
              validator: (value){
                return value.isEmpty?'Give price of your product':null;
              },
              onSaved: (value){
                return _price =value;
              },
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: 'Description',),
              validator: (value){
                return value.isEmpty?'Describe about  your product':null;
              },
              onSaved: (value){
                return _description =value;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              elevation: 10.0,
              child: Text('Add a New Image',),
              textColor: Colors.white,
              color: Colors.blue[900],
              onPressed: uploadNewProductImage,
            ),
          ],
          ),
      ),
    );
  }

}
