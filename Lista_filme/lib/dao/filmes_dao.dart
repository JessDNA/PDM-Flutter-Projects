import 'package:teste_projeto/database/app_database.dart';
import 'package:teste_projeto/model/filmes.dart';
import 'package:sqflite/sqflite.dart';

class FilmesDao{

  static final String column_id = 'id';
  static final String column_url= 'url';
  static final String column_titulo= 'titulo';
  static final String column_genero= 'genero';
  static final String column_faixa= 'faixa';
  static final String column_duracao= 'duracao';
  static final String column_nota= 'nota';
  static final String column_ano= 'ano';
  static final String column_descricao= 'descricao';

  static final String name_table_filmes = 'filmes';

  static final String tableFilmes = 'CREATE TABLE $name_table_filmes('
      '$column_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$column_url TEXT,'
      '$column_titulo TEXT,'
      '$column_genero TEXT,'
      '$column_faixa TEXT,'
      '$column_duracao TEXT,'
      '$column_nota TEXT,'
      '$column_ano TEXT,'
      '$column_descricao TEXT)';

  Future<int?> insert(Filmes filme) async{
    try {
      final Database db = await getDatabase();
      Map<String, dynamic> mapFilmes = Map();
      mapFilmes[column_url] = filme.url;
      mapFilmes[column_titulo] = filme.titulo;
      mapFilmes[column_genero] = filme.genero;
      mapFilmes[column_faixa] = filme.faixa;
      mapFilmes[column_duracao] = filme.duracao;
      mapFilmes[column_nota] = filme.nota;
      mapFilmes[column_ano] = filme.ano;
      mapFilmes[column_descricao] = filme.descricao;
      return db.insert(name_table_filmes, mapFilmes);
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<Filmes?> findById(int id) async{
    try {
      final Database db = await getDatabase();
      List<Map<String, dynamic>> maps = await db.query(
          name_table_filmes, where: '$column_id = ?', whereArgs: [id]);
      Filmes?filmes;
      filmes = Filmes.fromMapToFilmes(maps[0]);
      return filmes;
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<List<Filmes>?> findAll() async{
    try {
      final Database db = await getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(name_table_filmes);
      List<Filmes> filme = [];
      for (Map<String, dynamic> map in maps) {
        final filmes = Filmes.fromMapToFilmes(map);
        filme.add(filmes);
      }
      return filme;
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<int?> update(Filmes filmes) async{
    try {
      final Database db = await getDatabase();
      Map<String, dynamic> mapFilmes = Map();
      mapFilmes[column_url] = filmes.url;
      mapFilmes[column_titulo] = filmes.titulo;
      return db.update(name_table_filmes, mapFilmes, where: "$column_id = ?",
          whereArgs: [filmes.id]);
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<int?> delete(int? id) async{
    try {
      final Database db = await getDatabase();
      //delete from contatos where id = 'id'
      return db.delete(
          name_table_filmes, where: "$column_id = ?", whereArgs: [id]);
    }catch(e){
      print(e);
      return null;
    }
  }
}