import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Utility.dart';
import 'db_helperPhoto.dart';
import 'Photo.dart';
import 'dart:async';


class MyApp1 extends StatelessWidget {

	@override
  Widget build(BuildContext context) {

    return MaterialApp(
	    title: 'Images',
	    //debugShowCheckedModeBanner: false,
	    theme: ThemeData(
		    primarySwatch: Colors.deepPurple
	    ),
	    home: SaveImageDemoSQLite(),
    );
  }
}
class SaveImageDemoSQLite extends StatefulWidget {
  //
  SaveImageDemoSQLite() : super();

  final String title = "Flutter Save Image";

  @override
  _SaveImageDemoSQLiteState createState() => _SaveImageDemoSQLiteState();
}

class _SaveImageDemoSQLiteState extends State<SaveImageDemoSQLite> {
  //
  Future<File> imageFile;
  Image image;
  DBHelper dbHelper;
  List<Photo> images;

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();
  }

  refreshImages() {
    dbHelper.getPhotos().then((imgs) {
      setState(() {
        images.clear();
        images.addAll(imgs);
      });
      
        

    });
  }

  /*pickImageFromGallery() {
    Future<Image> showSelectedImage() async{

    
    String imgString= await ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
      //String imgString = Utility.base64String(imgFile.readAsBytesSync());
      //Image imgString = showSelectedImage();
      Photo photo = Photo(0, imgString);
      dbHelper.save(photo);
      refreshImages();
    
    });*/
    
pickImageFromGallery() {
    ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
      String imgString = Utility.base64String(imgFile.readAsBytesSync());
      Photo photo = Photo(0, imgString);
      dbHelper.save(photo);
      refreshImages();
    });
  }



  gridView() {
    
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: images.map((photo) {
          return Utility.imageFromBase64String(photo.photoName);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              pickImageFromGallery();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }
}