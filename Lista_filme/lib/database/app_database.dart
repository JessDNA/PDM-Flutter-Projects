//import 'package:teste_projeto/dao/contato_dao.dart';
import 'package:teste_projeto/dao/filmes_dao.dart';
import 'package:teste_projeto/model/filmes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String name_db = 'filmes.db';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), name_db);//data/data/database/databases/contatos.db
  return openDatabase(path, onCreate: (db, version){
    db.execute(FilmesDao.tableFilmes);
  }, version: 1);
}