import 'package:teste_projeto/dao/filmes_dao.dart';

class Filmes{
  int? id;
  String? url;
  String? titulo;
  String? genero;
  String? faixa;
  String? duracao;
  String? nota;
  String? ano;
  String? descricao;

  Filmes(this.url,this.titulo,this.genero,this.faixa,this.duracao,this.nota,this.ano,this.descricao,{this.id});

  Filmes.fromMapToFilmes(Map<String, dynamic>map){
    this.id = map[FilmesDao.column_id];
    this.url = map[FilmesDao.column_url];
    this.titulo = map[FilmesDao.column_titulo];
    this.genero = map[FilmesDao.column_genero];
    this.faixa = map[FilmesDao.column_faixa];
    this.duracao = map[FilmesDao.column_duracao];
    this.nota = map[FilmesDao.column_nota];
    this.ano = map[FilmesDao.column_ano];
    this.descricao = map[FilmesDao.column_descricao];

  }


}