void main() {
  var sanya = Human(name: "Саня",age: 23,height: 190);
  var dima = Human(name: "Дима",age: 23,height: 180);

  if(sanya.isHeihter(dima)) {
    print("Саня выше");
  } else {
    print("Дима выше");
  }
}

class Human {
  Human({
    required this.name, 
    required this.age, 
    required this.height
  });
  
  String name;
  int age;
  final double height;

  void grewUp({int years=1}) {
    age += years;
  }

  bool isHeihter(Human otherHuman) {
    return height > otherHuman.height;
  }

  //переопределяем метод toString для вывода информации о человеке
  @override
  String toString() {
    return 'Human(name: $name, age: $age, height: $height)';
  }
}