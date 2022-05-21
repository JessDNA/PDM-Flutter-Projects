import 'package:flutter/material.dart';
import 'package:questao_1/model/nota.dart';
import 'package:questao_1/views/list_medias.dart';

class InputNotas extends StatefulWidget {
  const InputNotas({Key? key}) : super(key: key);

  @override
  _InputNotasState createState() => _InputNotasState();
}

class _InputNotasState extends State<InputNotas> {
  TextEditingController edtNome = TextEditingController();
  TextEditingController edtnota1 = TextEditingController();
  TextEditingController edtnota2 = TextEditingController();

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text("Calcular Média"),
      actions: [
        IconButton(
            onPressed: () {
              alertDialogInformation();
            },
            icon: Icon(Icons.info))
      ],
    );
  }

  buildBody() {
    return Form(
      key: _formState,
      child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: edtNome,
                decoration: InputDecoration(labelText: "Nome"),
                validator: (nome){
                  if(nome != null){
                    if(nome.isEmpty){
                      return "Informe um nome";
                    }
                  }
                  return null;
                }
              ),
              TextFormField(
                controller: edtnota1,
                decoration: InputDecoration(labelText: "1ºNota"),
                keyboardType: TextInputType.number,
                  validator: (nota1){
                    if(nota1 != null){
                      if(nota1.isEmpty){
                        return "Informe a 1ºNota";
                      }
                    }
                    return null;
                  }
              ),
              TextFormField(
                controller: edtnota2,
                decoration: InputDecoration(labelText: "2ºNota"),
                keyboardType: TextInputType.number,
                  validator: (nota2){
                    if(nota2 != null){
                      if(nota2.isEmpty){
                        return "Informe a 2ºNota";
                      }
                    }
                    return null;
                  }
              ),
              Row(children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      FormState? formState = _formState.currentState;
                      double? nota1 = double.tryParse(edtnota1.text);
                      double? nota2 = double.tryParse(edtnota2.text);

                      if (nota1 != null && nota2 != null) {
                        Nota notas = Nota(edtNome.text, nota1, nota2);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return ListMedias(notas);
                            }));
                      }
                      if(formState != null){
                      if(!formState.validate()) {
                        return;
                      }
                      }
                    },
                    child: Text("Calcular Média"),
                  ),
                ),
              ]),
            ],
          ),
        ),
    );
  }

  void alertDialogInformation() {
      showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Desenvolvido Por:"),
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
      barrierDismissible: false);}
}
