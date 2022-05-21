import 'package:flutter/material.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:teste_projeto/dao/filmes_dao.dart';
import 'package:teste_projeto/model/filmes.dart';


class InputFilmes extends StatefulWidget {
  const InputFilmes({Key? key}) : super(key: key);

  @override
  _InputFilmesState createState() => _InputFilmesState();
}
class _InputFilmesState extends State<InputFilmes> {
  TextEditingController edtUrl = TextEditingController();
  TextEditingController edtTitulo = TextEditingController();
  TextEditingController edtGenero = TextEditingController();
  TextEditingController edtFaixa = TextEditingController();
  TextEditingController edtDuracao = TextEditingController();
  TextEditingController edtNota = TextEditingController();
  TextEditingController edtAno = TextEditingController();
  TextEditingController edtDescricao = TextEditingController();

  FilmesDao filmesDao = FilmesDao();


  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text("Cadastrar Filme"),
    );
  }

  buildBody() {
    return Form(
      key: _formState,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                  controller: edtUrl,
                  decoration: InputDecoration(labelText: "Url"),
                  validator: (url) {
                    if (url != null) {
                      if (url.isEmpty) {
                        return "Informe uma Url";
                      }
                    }
                    return null;
                  }),
              TextFormField(
                  controller: edtTitulo,
                  decoration: InputDecoration(labelText: "Título"),
                  validator: (titulo) {
                    if (titulo != null) {
                      if (titulo.isEmpty) {
                        return "Informe um Título";
                      }
                    }
                    return null;
                  }),
              TextFormField(
                  controller: edtGenero,
                  decoration: InputDecoration(labelText: "Gênero"),
                  validator: (genero) {
                    if (genero != null) {
                      if (genero.isEmpty) {
                        return "Informe uma Descrição";
                      }
                    }
                    return null;
                  }),
              TextFormField(
                  controller: edtFaixa,
                  decoration: InputDecoration(labelText: "Faixa Etária:"),
                  validator: (faixa) {
                    if (faixa != null) {
                      if (faixa.isEmpty) {
                        return "Informe uma Faixa Etária";
                      }
                    }
                    return null;
                  }),
              TextFormField(
                  controller: edtDuracao,
                  decoration: InputDecoration(labelText: "Duração"),
                  validator: (duracao) {
                    if (duracao != null) {
                      if (duracao.isEmpty) {
                        return "Informe uma Duração";
                      }
                    }
                    return null;
                  }),
              TextFormField(
                  controller: edtNota,
                  decoration: InputDecoration(labelText: "Nota"),
                  validator: (nota) {
                    if (nota != null) {
                      if (nota.isEmpty) {
                        return "Informe uma Nota";
                      }
                    }
                    return null;
                  }),
              TextFormField(
                  controller: edtAno,
                  decoration: InputDecoration(labelText: "Ano"),
                  validator: (ano) {
                    if (ano != null) {
                      if (ano.isEmpty) {
                        return "Informe um Ano";
                      }
                    }
                    return null;
                  }),
              TextFormField(
                  maxLines: 100,
                  controller: edtDescricao,
                  decoration: InputDecoration(labelText: "Descrição"),
                  validator: (descricao) {
                    if (descricao != null) {
                      if (descricao.isEmpty) {
                        return "Informe uma Descricao";
                      }
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ),
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        FormState? formState = _formState.currentState;
        if (formState != null) {
          if (!formState.validate()) {
            return;
          }
        }
        Filmes filme = Filmes(
            edtUrl.text,
            edtTitulo.text,
            edtGenero.text,
            edtFaixa.text,
            edtDuracao.text,
            edtNota.text,
            edtAno.text,
            edtDescricao.text);
        filmesDao.insert(filme);
        Navigator.pop(context);
      },
      child: Icon(Icons.save),
    );
  }
}
