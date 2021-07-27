import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Photosdb {
  static final Photosdb _db = new Photosdb._internal();
  Photosdb._internal();
  static Photosdb get instance => _db;
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _init();
    return _database;
  }

  Future<Database> _init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'photos.db'),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE photos(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descricao Text, path TEXT, data TEXT, latitude REAL, longitude REAL);",
        );
      },
      version: 5,
    );
  }
}
