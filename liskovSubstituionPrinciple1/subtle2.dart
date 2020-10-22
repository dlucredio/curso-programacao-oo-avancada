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

  void limparRetangulo(Retangulo r) {
    for (int i = r.y; i < r.y + r.altura; i++) {
      for (int j = r.x; j < r.x + r.largura; j++) {
        pixels[i][j] = ".";
        instrucoes++;
      }
    }
  }
}

class Retangulo {
  int x, y, largura, altura;
  Retangulo(this.x, this.y, this.largura, this.altura);
}

class Quadrado extends Retangulo {
  Quadrado(int x, int y, int lado) : super(x, y, lado, lado);

  // O problema está nesses "setters". Eles estão fazendo algo
  // que não era esperado pelos usuários da classe Retangulo
  // Em um retângulo, quando se altera a largura, a altura deve
  // permanecer a mesma (o mesmo para altura X largura)
  // Obviamente, no contexto DESTE sistema
  set altura(int valor) => super.largura = super.altura = valor;
  set largura(int valor) => super.largura = super.altura = valor;
}

void main(List<String> args) {
  var t = Tela(60, 15);

  //var r = Retangulo(3, 4, 10, 5);
  var r = Quadrado(3, 4, 5);
  t.adicionarRetangulo(r);
  t.instrucoes = 0;

  var console = ConsoleInterativo(() {
    t.desenharTelaNoConsole();
    var ret = t.instrucoes;
    t.instrucoes = 0;
    return ret;
  });
  console.adicionarFuncao(119, () {
    t.limparRetangulo(Retangulo(r.x, r.y + r.altura - 1, r.largura, 1));
    r.y--;
    t.adicionarRetangulo(Retangulo(r.x, r.y, r.largura, 1));
  }); // w
  console.adicionarFuncao(115, () {
    t.limparRetangulo(Retangulo(r.x, r.y, r.largura, 1));
    r.y++;
    t.adicionarRetangulo(Retangulo(r.x, r.y + r.altura - 1, r.largura, 1));
  }); // s
  console.adicionarFuncao(97, () {
    t.limparRetangulo(Retangulo(r.x + r.largura - 1, r.y, 1, r.altura));
    r.x--;
    t.adicionarRetangulo(Retangulo(r.x, r.y, 1, r.altura));
  }); // a
  console.adicionarFuncao(100, () {
    t.limparRetangulo(Retangulo(r.x, r.y, 1, r.altura));
    r.x++;
    t.adicionarRetangulo(Retangulo(r.x + r.largura - 1, r.y, 1, r.altura));
  }); // d
  console.adicionarFuncao(113, () {
    r.altura++;
    t.adicionarRetangulo(Retangulo(r.x, r.y + r.altura - 1, r.largura, 1));
  }); // q
  console.adicionarFuncao(101, () {
    r.largura++;
    t.adicionarRetangulo(Retangulo(r.x + r.largura - 1, r.y, 1, r.altura));
  }); // e
  console.adicionarFuncao(122, () {
    r.altura--;
    t.limparRetangulo(Retangulo(r.x, r.y + r.altura, r.largura, 1));
  }); // z
  console.adicionarFuncao(99, () {
    r.largura--;
    t.limparRetangulo(Retangulo(r.x + r.largura, r.y, 1, r.altura));
  }); // c
  console.interagir(27); // Esc para sair
}
