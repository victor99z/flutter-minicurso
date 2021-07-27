import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:tutorial_flutter/view/FormScreen.dart';

class MenuNav extends StatefulWidget {
  const MenuNav({Key? key}) : super(key: key);

  @override
  _MenuNavState createState() => _MenuNavState();
}

class _MenuNavState extends State<MenuNav> {
  _getImgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final Directory direc = await getApplicationDocumentsDirectory();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    String path = direc.path + '${DateTime.now()}.png';
    await image!.saveTo(path);
    return path;
  }

  _getImgFromCam() async {
    final ImagePicker _picker = ImagePicker();
    final Directory direc = await getApplicationDocumentsDirectory();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    String path = direc.path + '${DateTime.now()}.png';
    await image!.saveTo(path);
    // Salvar no db o nome da img vulgo dateTime.
    return path;
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
          onPressed: () async {
            String pathImg = await _getImgFromCam();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormScreen(path: pathImg)));
          },
        ),
        SpeedDialChild(
            child: Icon(Icons.photo_camera_back),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'Abrir galeria',
            onPressed: () async {
              String pathImg = await _getImgFromGallery();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FormScreen(path: pathImg)));
            }),
        //  Your other SpeeDialChildren go here.
      ],
    );
  }
}
