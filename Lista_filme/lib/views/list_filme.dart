import 'package:flutter/material.dart';
import 'package:teste_projeto/components/drawer_component.dart';
import 'package:teste_projeto/dao/filmes_dao.dart';
import 'package:teste_projeto/model/filmes.dart';
import 'package:teste_projeto/views/details_filme.dart';
import 'input_filmes.dart';

class ListFilme extends StatefulWidget {
  const ListFilme({Key? key}) : super(key: key);

  @override
  _ListFilmeState createState() => _ListFilmeState();
}


class _ListFilmeState extends State<ListFilme> {

  List<Filmes> filme = [] ;
  FilmesDao filmesDao = FilmesDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
          child: FutureBuilder(
            future: filmesDao.findAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text("Loading...")
                        ],
                      ),
                    ),
                  );
                  break;
                case ConnectionState.active:

                  break;
                case ConnectionState.done:
                  filme = snapshot.data as List<Filmes>;
                  //List<Filmes> filme = index.data as List<Filmes>;
                  //final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

                  return ListView.builder(
                      itemCount: filme.length,
                      itemBuilder: (context, index) {
                        final filmes = filme[index];
                        return Dismissible(
                          key: ObjectKey(filmes),
                          onDismissed: (direction){
                            setState(() {
                              filme.remove(filmesDao.delete(filme[index].id));

                            });
                          },
                          background: Container(color: Colors.red),
                          child: GestureDetector(
                            child: Container(
                              height:150,
                              padding: EdgeInsets.only(right: 30.0,left: 30.0),
                              child: ListTile(
                                minVerticalPadding: 10,
                                minLeadingWidth: 100,
                                leading:Image.network("${filme[index].url}"),
                                title: Text("${filme[index].titulo}"),
                                subtitle: Column(
                                  children: [Text("${filme[index].genero}"),
                                    Text("${filme[index].duracao}")
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Menu de opções"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return DetailsFilme(filme[index]);
                                              }));
                                            });
                                          },
                                          child: Text("Exibir dados")),
                                      TextButton(
                                          onPressed: () {
                                           Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return InputFilmes();
                                            }),
                                            );
                                          },
                                          child: Text("Alterar")),
                                    ],
                                  );
                                },  );

                            },
                          ),
                        );
                      }
                  );
                  break;
              }
              return Text("Error");
            },
          )
      ),
      floatingActionButton: buildFloatActionButton(),
      drawer: DrawerComponent(),
    );
  }



  buildAppBar() {
    return AppBar(
      title: Text("Lista de Filmes"),
      actions: [
        IconButton(
            onPressed: () {
              alertDialogInformation();
            },
            icon: Icon(Icons.info))
      ],
    );
  }


  buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: () {
        actionNavigationInputFilmes();
      },
      child: Icon(Icons.add),
    );
  }

  void actionNavigationInputFilmes() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InputFilmes();
    }),
    );
  }

  void alertDialogInformation() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Desenvolvido por:"),
            content: Text("Jessé Alves"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        },
        barrierDismissible: false);
  }
}
