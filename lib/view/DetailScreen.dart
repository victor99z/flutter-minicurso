import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tutorial_flutter/controller/PhotosController.dart';
import 'HomeScreen.dart';

class DetailScreen extends StatelessWidget {
  final dynamic detail;
  final PhotosController controller = PhotosController();

  DetailScreen({Key? key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(detail.getTitulo),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.file(
              File(detail.getPath),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                detail.getDescricao,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Latitude: ${detail.getLatitude}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Longitude: ${detail.getLongitude}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Data: ${detail.getData}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.deletePhoto(id: detail.getId);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Excluir'),
              ),
            ),
          ],
        )));
  }
}
