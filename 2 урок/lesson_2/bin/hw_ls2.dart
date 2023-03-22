import 'dart:math';

void main() {
  Figure circle = Circle(name: 'Круг', radius: 2);
  circle.showAll();

  Figure triangle = Triangle(
    name: 'Триугольник',
    h: 20,
    v: 5,
    d: 6,
  );

  triangle.showAll();

  Figure paral = Parallelogram(
    name: 'Парралелограм',
    c: 15,
    d: 45,
    h: 5,
  );

  paral.showAll();
}

abstract class Figure {
  double a;
  double b;
  String name;

  Figure(this.a, this.b, this.name);

  double square() {
    return a * b;
  }

  double perimitr() {
    return 2 * a + 2 * b;
  }

  void showAll() {
    var S = square();
    var P = perimitr();
    print('==================================');
    print('Фигура: $name\nПлощадь: $S\nПериметр: $P');
    print('==================================\n');
  }
}

class Circle extends Figure {
  double radius;
  Circle({required this.radius, required name})
      : super(pi, radius * radius, name);

  @override
  double perimitr() {
    return radius * 2 * pi;
  }
}

class Triangle extends Figure {
  double h;
  double v;
  double d;
  late double c;

  Triangle({
    required this.v,
    required this.h,
    required this.d,
    required name,
  }) : super(h * 0.5, v, name) {
    c = sqrt(v * v + d * d);
  }

  @override
  double perimitr() {
    return v + d + c;
  }
}

class Parallelogram extends Figure {
  double h;
  double c;
  double d;

  Parallelogram({
    required this.h,
    required this.c,
    required this.d,
    required name,
  }) : super(h, c, name);

  @override
  double perimitr() {
    return d * 2 + c * 2;
  }
}
