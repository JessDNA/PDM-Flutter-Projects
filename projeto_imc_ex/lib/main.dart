import 'package:flutter/material.dart';

main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar:buildAppBar() ,
        body: InputCalculoIMC(),
    ),
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      title: Text("Calcular IMC"),
      centerTitle: true,
    );
  }
}

class InputCalculoIMC extends StatefulWidget {

  @override
  _InputCalculoIMCState createState() => _InputCalculoIMCState();
}

class _InputCalculoIMCState extends State<InputCalculoIMC> {
  TextEditingController edtNome = TextEditingController();
  TextEditingController edtPeso = TextEditingController();
  TextEditingController edtAlt = TextEditingController();
  String nome = "";
  double? peso = 0;
  double? alt = 0, imc = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            TextField(
              controller: edtNome,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: edtPeso,
              decoration: InputDecoration(labelText: "Peso"),
            ),
            TextField(
              controller: edtAlt,
              decoration: InputDecoration(labelText: "Altura"),
            ),
            Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {calcularImc();},
                      child: Text("Calcular"),
                    ),
                  ),
                ]
            ),
            Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Text("Nome:$nome", style: TextStyle(fontSize: 18),),
                    Text("Peso: $peso", style: TextStyle(fontSize: 18)),
                    Text("Altura: $alt", style: TextStyle(fontSize: 18)),
                    Text("IMC: $imc", style: TextStyle(fontSize: 18)),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

    void calcularImc(){
      nome = edtNome.text;
      double? peso = double.tryParse(edtPeso.text);
      double? alt = double.tryParse(edtAlt.text);

      setState  (() {
        if (alt!= null && peso!=null){
          this.peso = peso;
          this.alt = alt;
          imc = double.parse((peso/(alt*alt)).toStringAsFixed(2));
        }else{
          print("Informe um Número!");
        }
      });
    }
  }

