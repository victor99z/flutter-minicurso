import 'dart:io';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:tutorial_flutter/controller/PhotosController.dart';
import 'package:tutorial_flutter/model/Photos.dart';
import 'package:tutorial_flutter/view/HomeScreen.dart';

class FormScreen extends StatefulWidget {
  final dynamic path;
  const FormScreen({Key? key, this.path}) : super(key: key);
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController _titulo = TextEditingController();
  TextEditingController _descricao = TextEditingController();
  dynamic _latitude = 0.0;
  dynamic _longitude = 0.0;
  String data =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';

  Future<void> getLocation() async {
    setState(() {
      Location().getLocation().then((value) {
        _latitude = value.latitude;
        _longitude = value.longitude;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Image.file(
            File(widget.path),
            height: 300,
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          TextFormField(
            controller: _titulo,
            decoration: new InputDecoration(hintText: 'Titulo'),
            maxLength: 40,
          ),
          TextFormField(
            controller: _descricao,
            decoration: new InputDecoration(hintText: 'Descrição '),
            maxLength: 200,
          ),
          ElevatedButton(
              onPressed: () async {
                getLocation().whenComplete(() {
                  addNewPhoto(_titulo.text, _descricao.text, widget.path, data,
                      _latitude, _longitude);
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: new Text('Enviar'))
        ]),
      ),
    );
  }
}

void addNewPhoto(titulo, desc, path, data, latitude, longitude) {
  Photos ft = Photos(
      titulo: titulo,
      descricao: desc,
      path: path,
      data: data,
      latitude: latitude,
      longitude: longitude);
  PhotosController().insertPhoto(ft: ft);
}
