import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'file:///E:/Ashwini_Work/Flutter_Workspace/masscoinex_nikhat_task/masscoinex_nikhat_task/lib/model/model.dart';

class UploadingImage extends StatefulWidget {
  @override
  _UploadingImageState createState() => _UploadingImageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
Model model = new Model();

class _UploadingImageState extends State<UploadingImage> {
  PickedFile _image;
  final picker = ImagePicker();
  bool isSelected = true;

  Future getImage(String isFrom) async {
    var image;
    switch (isFrom) {
      case "camera":
        image = await picker.getImage(source: ImageSource.camera);
        break;
      case "gallery":
        image = await picker.getImage(source: ImageSource.gallery);
        break;
    }

    setState(() {
      if (image != null) {
        _image = image;
        isSelected = false;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const RoundedRectangleBorder roundedRectangleBorder =
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)));

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        shape: roundedRectangleBorder,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: _image == null
                  ? Text(
                      'Select Image to Upload',
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    )
                  : Text(
                      'Image selected!',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.greenAccent),
                    ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Visibility(
                visible: isSelected,
                child: FlatButton(
                  onPressed: () {
                    getImage("camera");
                  },
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isSelected,
              child: Text(
                '(or)',
                style: TextStyle(fontSize: 10),
              ),
            ),
            Container(
              child: Visibility(
                visible: isSelected,
                child: FlatButton(
                  onPressed: () {
                    getImage("gallery");
                  },
                  child: Icon(
                    Icons.add_photo_alternate,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            uploadImageButton(context),
          ],
        ),
      ), //to overlapping the widgets stack is used
    );
  }

  Widget uploadImageButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      margin:
          const EdgeInsets.only(top: 30, left: 20.0, right: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellowAccent, Colors.orange],
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: FlatButton(
        onPressed: () {
          if (_image != null) {
            model.image = File(_image.path);
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Image Upload Successfully!",
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 2),
            ));
            Navigator.pushReplacementNamed(context, "splash");
          } else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Please select image to upload.",
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 2),
            ));
          }
        },
        child: Text(
          "Upload Image",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
