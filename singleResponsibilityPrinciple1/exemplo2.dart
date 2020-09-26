class Produto {
  int id;
  String descricao;
  double preco;

  Produto(this.id, this.descricao, this.preco);
}

class CalcularImposto {
  double calcularICMS(Produto p, double taxa) {
    return p.preco * taxa;
  }
}

main() {
  var p = Produto(1,"Vassoura", 2.99);
  var c = CalcularImposto();
  var icms = c.calcularICMS(p, 0.04);
  print("Valor do ICMS = ${icms.toStringAsFixed(2)}");
}