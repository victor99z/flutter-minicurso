import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutorial_flutter/repository/PhotosRepository.dart';
import 'package:tutorial_flutter/view/DetailScreen.dart';

class PhotosCard extends StatefulWidget {
  const PhotosCard({Key? key}) : super(key: key);

  @override
  _PhotosCardState createState() => _PhotosCardState();
}

class _PhotosCardState extends State<PhotosCard> {
  dynamic _lista = PhotosRepository().selectAllPhotos();

  _atualizaCard() {
    _lista = PhotosRepository().selectAllPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _lista,
      builder: (context, future) {
        if (!future.hasData)
          return Center(child: CircularProgressIndicator());
        else {
          dynamic list = future.data;
          return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.all(20.0),
                    elevation: 5.0,
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(detail: list[index])))
                            .then((value) => _atualizaCard())
                      },
                      child: Column(
                        children: [
                          Image.file(
                            File(list[index].getPath),
                          ),
                          ListTile(
                            title: (list[index] != null)
                                ? Text('${list[index].getTitulo}')
                                : Text('Sem titulo'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              list[index].getDescricao,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ));
              },
              itemCount: list.length);
        }
      },
    );
  }
}
