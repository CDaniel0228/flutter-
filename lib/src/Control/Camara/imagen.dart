import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagen {
  var imageFile;
  final ImagePicker _picker = ImagePicker();

  openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    imageFile = picture.toString();
    /*setState(() {
      imageFile = picture.toString();
    });*/

    Navigator.of(context).pop();
  }

  openGallery(BuildContext context) async {
    imageFile = await _picker.pickImage(source: ImageSource.gallery);

    /*setState(() {
      imageFile = picture.toString();
    });*/
    Navigator.of(context).pop();
  }

  Widget setImageView() {
    if (imageFile != null) {
      return Image.file(imageFile, width: 100, height: 100);
    } else {
      return Text("Please select an image");
    }
  }

  Future<void> showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }
}
