void main(List<String> args) {
  Cat cat = Cat();

}






abstract class Animal {}

abstract class Mammal extends Animal {}

abstract class Bird extends Animal {}

abstract class Fish extends Animal {}

abstract class Walker {
  // This class is intended to be used as a mixin, and should not be
  // extended directly.
  // factory Walker._() => null;

  void walk() {
    print("I'm walking");
  }
}

abstract class Swimmer {
  // This class is intended to be used as a mixin, and should not be
  // extended directly.
  // factory Swimmer._() => null;

  void swim() {
    print("I'm swimming");
  }
}

abstract class Flyer {
  // This class is intended to be used as a mixin, and should not be
  // extended directly.
  // factory Flyer._() => null;

  void fly() {
    print("I'm flying");
  }
}



class Dolphin extends Mammal with Swimmer {}

class Bat extends Mammal with Walker, Flyer {}

class Cat extends Mammal with Walker {}

class Dove extends Bird with Walker, Flyer {}

class Duck extends Bird with Walker, Swimmer, Flyer {}

class Shark extends Fish with Swimmer {}

class FlyingFish extends Fish with Swimmer, Flyer {}




mixin Swim {
  void swim() => print('Swimming');
}

mixin Bite {
  void bite() => print('Chomp');
}

mixin Crawl {
  void crawl() => print('Crawling');
}

abstract class Reptile with Swim, Crawl, Bite {
  void hunt(food) {
    print('${this.runtimeType} -------');
    swim();
    crawl();
    bite();
    print('Eat $food');
  }
}

class Alligator extends Reptile {
  // Alligator Specific stuff...
}

class Crocodile extends Reptile {
  // Crocodile Specific stuff...
}

class Fish2 with Swim, Bite {
  void feed() {
    print('Fish --------');
    swim();
    bite();
  }
}