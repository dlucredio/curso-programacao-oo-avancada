import 'simple4.dart';

class Retangulo {
  double altura, largura;
  Retangulo(this.altura, this.largura);

  double area() {
    return this.altura * this.largura;
  }
}

class Quadrado extends Retangulo {
  Quadrado(double lado) : super(lado, lado);
  set altura(double valor) => super.largura = super.altura = valor;
  set largura(double valor) => super.largura = super.altura = valor;
}

main(List<String> args) {
//  var r = Retangulo(5, 10);
  var r = Quadrado(5);

  var consoleInterativo = ConsoleInterativo(r);
  consoleInterativo.interagir();
}
