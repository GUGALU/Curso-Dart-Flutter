import 'package:gifinder/entity/gif.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart" as path;

const String sql = """
CREATE TABLE GIF(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url VARCHAR(500) NOT NULL,
    preview VARCHAR(500) NOT NULL
);
""";

class Banco {
  static Database? db;

  static checarDb() async {
    db ??= await initDb();
  }

  static initDb() async {
    String caminho = path.join(await getDatabasesPath(), "db_gifinder");
    return await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) {
        db.execute(sql);
      },
    );
  }

  static Future<int?> salvar(Gif gif) async {
    await checarDb();
    var sql = "INSERT INTO GIF(url, preview) VALUES(?, ?)";
    int? id = await db?.rawInsert(sql, [gif.url, gif.previewUrl]);

    return id;
  }

  static Future<List<Gif>> buscar() async {
    await checarDb();

    List<Map<String, dynamic>> resultado = await db!.query('GIF');

    var gifs = <Gif>[];

    for (var json in resultado) {
      gifs.add(Gif.fromDatabase(json));
    }

    return gifs;
  }

  static Future<void> remover(int id) async {
    var sql = "DELETE FROM GIF WHERE id = ?";
    await db!.rawDelete(sql, [id]);
  }

  static Future<int?> estaNoBanco(String url) async {
    await checarDb();
    var resultado = await db!.rawQuery('SELECT id FROM GIF WHERE url = ?;', [url]);
    if (resultado.isNotEmpty){
      return resultado[0]['id'] as int?;
    }
  }
}
