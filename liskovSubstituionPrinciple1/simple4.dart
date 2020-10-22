import 'dart:io';

import 'simple3.dart';

class ConsoleInterativo {
  Retangulo r;
  ConsoleInterativo(this.r);

  void interagir() {
    stdin.lineMode = false;
    stdin.echoMode = false;

    int input = 0;
    while ((input = stdin.readByteSync()) != 27) {
      switch (input) {
        case 119: // w
          r.altura++;
          break;
        case 115: // s
          r.altura--;
          break;
        case 97: // a
          r.largura--;
          break;
        case 100: // d
          r.largura++;
          break;
      }
      desenhar();
    }
  }

  void desenhar() {
    print("\n\n\n\n\n\n\n\n\n\n\n\n");
    for (var i = 0; i < r.altura; i++) {
      var x = "";
      for (var j = 0; j < r.largura; j++) {
        x += ".";
      }
      print(x);
    }
  }
}
