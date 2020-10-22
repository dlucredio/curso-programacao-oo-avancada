import 'dart:math';
import 'simple2.dart' as simple2;

abstract class Forma {
  double area();
}

class Retangulo extends Forma {
  double altura, largura;
  Retangulo(this.altura, this.largura);

  double area() {
    return this.altura * this.largura;
  }
}

class Triangulo extends Forma {
  double a, b, c;
  Triangulo(this.a, this.b, this.c);

  double area() {
    var p = (a + b + c) / 2;
    return sqrt(p * (p - a) * (p - b) * (p - c));
  }
}

class Ponto {
  double x, y;
  Ponto(this.x, this.y);
}

class Canvas {
  double altura, largura;
  Canvas(this.altura, this.largura);

  void area() {
    for (var i = 0; i < this.altura; i++) {
      var x = "";
      for (var j = 0; j < this.largura; j++) {
        x += "#";
      }
      x += "\n";
      print(x);
    }
  }
}

main(List<String> args) {
  var r = Retangulo(5, 10);
  var t = Triangulo(5, 6, 7);
  var c = Canvas(5, 10);
  var p = Ponto(5, 10);

  print(r.area());
  print(simple2.processarForma(r));
}
