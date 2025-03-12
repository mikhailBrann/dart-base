void main() {

}

abstract class Animal {
  double get age;

  void makeSound();
}


/**
модификатор final запрещает наследование класса Bird
за пределами файла
пример: owl.dart
 */
final class Bird extends Animals {
  Bird({required this.age});

  @override
  final double age;

  @override
  void makeSound() {
    print('Chirp');
  }
}

