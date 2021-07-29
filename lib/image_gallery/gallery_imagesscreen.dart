import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:streamo/image_gallery/product_databasemodel.dart';
import 'package:streamo/image_gallery/upload_imagescreen.dart';

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  List<ProductImageDetails> listProductImages = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference productImageRef =
        FirebaseDatabase.instance.reference().child("Posted Products Images");
    productImageRef.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;

      listProductImages.clear();

      for (var individualKey in keys)
      {
        ProductImageDetails products = new ProductImageDetails(
          title: data[individualKey]['title'],
          image: data[individualKey]["image"],
          price: int.parse(data[individualKey]["price"].toString()),
          description: data[individualKey]["description"],
        );

        listProductImages.add(products);
//        print("PRICE : " + data[individualKey]['price'].toString());
//        print("Image : " + data[individualKey]['image'].toString());
      }

      setState(() {
        print("Length: ${listProductImages.length}");

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text(
          'Image Gallery',
        ),
      ),
      body: new Container(
        child: listProductImages.length == 0
            ? Center(child: new Text('Yet not post any picture for sale'))
            : new ListView.builder(
          itemCount: listProductImages.length,
                itemBuilder: (_, index) {
                  return imageGalleryUI(
                      listProductImages[index].image,
                      listProductImages[index].title,
                      listProductImages[index].price,
                      listProductImages[index].description);
                },

              ),
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.blue[900],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: IconButton(
            alignment: Alignment.center,
            icon: new Icon(
              Icons.add_a_photo,
              size: 40.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new UploadImageScreen();
              }));
            },
          ),
        ),
      ),
    );
  }

  //gallery screen ui widget
  Widget imageGalleryUI(
      String image, String title, int price, String description) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                return Text('Your error widget...');
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Rs. $price',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              description ?? '',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
