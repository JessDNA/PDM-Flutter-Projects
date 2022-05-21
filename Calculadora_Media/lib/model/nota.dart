class Nota {
  String nome;
  double nota1;
  double nota2;
  late double media ;
  Nota(this.nome,this.nota1,this.nota2){
    calcularMedia();
  }

  void calcularMedia() {
    media = (nota1+nota2)/2;
  }



}