import 'console.dart';

class Tela {
  List<List<String>> pixels;
  int instrucoes = 0;
  Tela(int largura, int altura) {
    pixels = List<List<String>>();
    pixels = List.generate(altura, (i) => List(largura), growable: false);
    limparTela();
  }

  void limparTela() {
    for (int i = 0; i < pixels.length; i++) {
      for (int j = 0; j < pixels[i].length; j++) {
        pixels[i][j] = '.';
        instrucoes++;
      }
    }
  }

  void desenharTelaNoConsole() {
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n");
    for (int i = 0; i < pixels.length; i++) {
      String linha = "";
      for (int j = 0; j < pixels[i].length; j++) {
        linha += pixels[i][j];
      }
      print(linha);
    }
  }

  void adicionarRetangulo(Retangulo r) {
    for (int i = r.y; i < r.y + r.altura; i++) {
      for (int j = r.x; j < r.x + r.largura; j++) {
        pixels[i][j] = "#";
        instrucoes++;
      }
    }
  }
}

class Retangulo {
  int x, y, largura, altura;
  Retangulo(this.x, this.y, this.largura, this.altura);
}

void main(List<String> args) {
  var t = Tela(60, 15);

  var r = Retangulo(3, 4, 10, 5);
  t.adicionarRetangulo(r);
  t.instrucoes = 0;

  var console = ConsoleInterativo(() {
    t.limparTela();
    t.adicionarRetangulo(r);
    t.desenharTelaNoConsole();
    var ret = t.instrucoes;
    t.instrucoes = 0;
    return ret;
  });
  console.adicionarFuncao(119, () => r.y--); // w
  console.adicionarFuncao(115, () => r.y++); // s
  console.adicionarFuncao(97, () => r.x--); // a
  console.adicionarFuncao(100, () => r.x++); // d
  console.adicionarFuncao(113, () => r.altura++); // q
  console.adicionarFuncao(101, () => r.largura++); // e
  console.adicionarFuncao(122, () => r.altura--); // z
  console.adicionarFuncao(99, () => r.largura--); // c
  console.interagir(27); // Esc para sair
}
