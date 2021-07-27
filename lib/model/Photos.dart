import 'dart:convert';

class Photos {
  int? id;
  String? titulo;
  String? descricao;
  String? path;
  String? data;
  double? latitude;
  double? longitude;

  int? get getId => this.id;

  set setId(id) => this.id = id;

  get getTitulo => this.titulo;

  set setTitulo(titulo) => this.titulo = titulo;

  get getDescricao => this.descricao;

  set setDescricao(descricao) => this.descricao = descricao;

  get getPath => this.path;

  set setPath(path) => this.path = path;

  get getData => this.data;

  set setData(data) => this.data = data;

  get getLatitude => this.latitude;

  set setLatitude(latitude) => this.latitude = latitude;

  get getLongitude => this.longitude;

  set setLongitude(longitude) => this.longitude = longitude;

  Photos({
    this.id,
    this.titulo,
    this.descricao,
    this.path,
    this.data,
    this.latitude,
    this.longitude,
  });

  @override
  String toString() {
    return 'Photos(id: $id, titulo: $titulo, descricao: $descricao, path: $path, data: $data, latitude: $latitude, longitude: $longitude)';
  }
}
