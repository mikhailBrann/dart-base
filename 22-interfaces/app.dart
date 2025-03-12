void main() {
  final wolf = Wolf();
  final tiger = Tiger(age: 10);

  wolf.makeSound();
  tiger.makeSound();
  tiger.makePerformance();

  print(wolf.age);
  print(tiger.age);
}

abstract interface class Animal {
  //в интерфесах передача полей через геттеры
  double get age;

  void makeSound();
}

class Wolf implements Animal {
  Wolf({
    this.age=0
  });

  @override
  void makeSound() {
    print("Woof");
  }

  @override
  final double age;
}

class Tiger implements Animal {
  Tiger({
    this.age=0
  });

  @override
  void makeSound() {
    print("Rrrrr");
  }

  void makePerformance() {
    print("Tiger is performing");
  }

  @override
  final double age;
}