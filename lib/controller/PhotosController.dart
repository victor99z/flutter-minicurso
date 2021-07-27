import 'package:tutorial_flutter/model/Photos.dart';
import 'package:tutorial_flutter/repository/PhotosRepository.dart';

class PhotosController {
  insertPhoto({ft: Photos}) {
    Future<int> fetch = PhotosRepository().insert(ft);

    return fetch;
  }

  getAllPhotos() {
    Future<dynamic> response = PhotosRepository().selectAllPhotos();

    return response;
  }

  deletePhoto({id: int}) {
    Future fetch = PhotosRepository().delete(id);
    return fetch;
  }
}
