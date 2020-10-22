const simple2 = require('./simple2');

class Retangulo {
    constructor(altura, largura) {
        this.altura = altura; this.largura = largura;
    }

    area() {
        return this.altura * this.largura;
    }
}

class Triangulo {
    constructor(a, b, c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    area() {
        const p = (this.a + this.b + this.c) / 2;
        return Math.sqrt(p*(p-this.a)*(p-this.b)*(p-this.c));
    }
}

class Ponto {
    constructor(x, y) {
        this.x = x; this.y = y;
    }
}

class Canvas {
    constructor(altura, largura) {
        this.altura = altura;
        this.largura = largura;
    }

    area() {
        for (var i = 0; i < this.altura; i++) {
            let x = "";
            for (var j = 0; j < this.largura; j++) {
                x += "#";
            }
            console.log(x);
        }
    }
}

//let r = new Retangulo(5, 10);
//let r = new Triangulo(5, 7, 8);
//let r = new Ponto(5, 10);
//let r = new Canvas(5, 10);

console.log(r.area());
console.log(simple2.processarForma(r));