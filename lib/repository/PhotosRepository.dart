import 'package:tutorial_flutter/model/PhotosDb.dart';
import 'package:tutorial_flutter/model/Photos.dart';

class PhotosRepository {
  insert(Photos photos) async {
    String sql =
        "INSERT INTO photos(titulo,descricao,path,data,latitude,longitude) values('${photos.getTitulo}','${photos.getDescricao}','${photos.getPath}','${photos.getData}',${photos.getLatitude},${photos.getLongitude})";
    Future<int> db =
        Photosdb.instance.database.then((value) => value!.rawInsert(sql));
    //PhotosDb().db!.rawInsert(sql);
    return db;
  }

  Future<List<Photos>> selectAllPhotos() async {
    String sql = 'select * from photos';
    Future<dynamic> db =
        await Photosdb.instance.database.then((value) => value!.rawQuery(sql));
    // PhotosDb().db!.rawQuery(sql);
    List<Photos> lista = [];
    db.then((value) {
      for (var item in value) {
        lista.add(new Photos(
            id: item['id'],
            titulo: item['titulo'],
            descricao: item['descricao'],
            path: item['path'],
            data: item['data'],
            latitude: item['latitude'],
            longitude: item['longitude']));
      }
    });
    print(lista.toString());
    return lista;
  }

  delete(int id) async {
    String sql = 'delete from photos where id = $id';
    Future<dynamic> db =
        await Photosdb.instance.database.then((value) => value!.rawDelete(sql));
    // PhotosDb().db!.rawDelete(sql);
    return db;
  }
}
