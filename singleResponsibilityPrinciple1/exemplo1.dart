class Produto {
  int id;
  String descricao;
  double preco;

  Produto(this.id, this.descricao, this.preco);

  double calcularICMS(double taxa) {
    return preco * taxa;
  }
}

main() {
  var p = Produto(1,"Vassoura", 2.99);
  var icms = p.calcularICMS(0.04);
  print("Valor do ICMS = ${icms.toStringAsFixed(2)}");
}