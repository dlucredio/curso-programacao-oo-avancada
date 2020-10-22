import 'dart:io';

class ConsoleInterativo {
  final funcoes = Map<int, Function>();
  final int Function() fimInteracao;

  ConsoleInterativo(this.fimInteracao);

  void adicionarFuncao(int key, Function f) {
    funcoes[key] = f;
  }

  void interagir(int teclaEncerramento) {
    stdin.lineMode = false;
    stdin.echoMode = false;

    int input = 0;
    while ((input = stdin.readByteSync()) != teclaEncerramento) {
      Function f = funcoes[input];
      f?.call();
      int tempo = fimInteracao();
      print("Comando: ${input} - Tempo: ${tempo}");
    }
  }
}
