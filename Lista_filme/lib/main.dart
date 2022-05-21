import 'package:flutter/material.dart';
import 'package:teste_projeto/model/filmes.dart';
import 'package:teste_projeto/views/details_filme.dart';
import 'package:teste_projeto/database/app_database.dart';
import 'package:teste_projeto/views/list_filme.dart';
import 'package:teste_projeto/views/input_filmes.dart';
import 'dao/filmes_dao.dart';

// 'https://t.ctcdn.com.br/KhOz1gb8VWBa5JogR7ltrKe6isg=/512x288/smart/i526346.png',
//flutter_rating_bar 4.0.0
main() async{
  runApp(MainApp());
  FilmesDao filmesDao = FilmesDao();
  List<Filmes>? filme = await filmesDao.findAll();

  filmesDao.insert(Filmes(
      'https://cdn.falauniversidades.com.br/wp-content/uploads/2018/08/fc48b65d5e3242e68045e51f64d024ff_compressed.jpg',
      'Velozes e Furiosos 8',
      'Ação, Aventura,Suspense',
      '14',
      '2h 16min',
      '4',
      '2017',
      'Dom (Vin Diesel) e Letty (Michelle Rodriguez) estão curtindo a lua de mel em Havana, mas a súbita aparição de Cipher (Charlize Theron) atrapalha os planos do casal. Ela logo arma um plano para chantagear Dom, de forma que ele traia seus amigos e passe a ajudá-la a obter ogivas nucleares. Tal situação faz com Letty reúna os velhos amigos, que agora precisam enfrentar Cipher e, consequentemente, Dom.')).then((id) => print(id));

  /*filmesDao.update(Filmes('https://t.ctcdn.com.br/KhOz1gb8VWBa5JogR7ltrKe6isg=/512x288/smart/i526346.png',
  'Velozes e Furiosos 8',
  'Ação, Aventura,Suspense',
  '14',
  '2h 16min',
  '4',
  '2017',
  'Dom (Vin Diesel) e Letty (Michelle Rodriguez) estão curtindo a lua de mel em Havana, mas a súbita aparição de Cipher (Charlize Theron) atrapalha os planos do casal. Ela logo arma um plano para chantagear Dom, de forma que ele traia seus amigos e passe a ajudá-la a obter ogivas nucleares. Tal situação faz com Letty reúna os velhos amigos, que agora precisam enfrentar Cipher e, consequentemente, Dom.', id: 2)).then((id) => print(id));
*/
  //filmesDao.delete(5).then((qtde) => print(qtde));
  //filmesDao.findById(4).then((filme) {if (filmes != null) print(filme);});

}
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListFilme(),
    );
  }
}