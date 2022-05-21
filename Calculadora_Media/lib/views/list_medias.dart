import 'package:flutter/material.dart';
import 'package:questao_1/model/nota.dart';

class ListMedias extends StatelessWidget {

  Nota media;
  ListMedias(this.media);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Médias dos alunos"),
    );
  }

  buildBody() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nome: ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text("${media.nome}")), Text(
            "Média: ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text("${media.media}")),
        ],
      ),
    );
  }
  }
