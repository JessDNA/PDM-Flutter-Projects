import 'package:flutter/material.dart';
import 'package:teste_projeto/model/filmes.dart';

class DetailsFilme extends StatelessWidget {
  Filmes filme;

  DetailsFilme(this.filme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  buildAppBar() {
    return AppBar(title: Text("Detalhes"));
  }

  buildBody() {
    return Column(

      children: [
        Image.network("${filme.url}",height: 300,width: 300,),
        ListTile(
            title: Text(
              "${filme.titulo}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text("${filme.genero}")),
                     Text("${filme.faixa} anos"),
                  ],),
                Row(
                  children: [
                  Expanded(child: Text("${filme.duracao}")),
                  Text("${filme.nota} "),],),

              ],
            )),
        Expanded(child: Text("${filme.descricao}"))
      ],
    );
  }
}
