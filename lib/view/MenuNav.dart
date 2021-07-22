import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class MenuNav extends StatefulWidget {
  const MenuNav({Key? key}) : super(key: key);

  @override
  _MenuNavState createState() => _MenuNavState();
}

class _MenuNavState extends State<MenuNav> {
  _getImgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    print(image!.length());
  }

  _getImgFromCam() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? photos = await _picker.pickImage(source: ImageSource.camera);

    print(photos!.lastModified());
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      child: Icon(Icons.menu),
      closedForegroundColor: Colors.white,
      openForegroundColor: Colors.white,
      closedBackgroundColor: Colors.blue,
      openBackgroundColor: Colors.blue,
      labelsStyle: TextStyle(fontWeight: FontWeight.bold),
      speedDialChildren: <SpeedDialChild>[
        SpeedDialChild(
          child: Icon(Icons.camera_alt_outlined),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          label: 'Tirar foto',
          onPressed: () => {_getImgFromCam()},
        ),
        SpeedDialChild(
          child: Icon(Icons.photo_camera_back),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          label: 'Abrir galeria',
          onPressed: () => {_getImgFromGallery()},
        ),
        //  Your other SpeeDialChildren go here.
      ],
    );
  }
}
