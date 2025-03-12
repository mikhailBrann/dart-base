void main() {
  var sanya = Human(name: "Саня",age: 23,height: 190);
  var katya = Human(name: "Катя",age: 25,height: 165);

  print(Human.count);
}

class Human {
  Human({
    required this.name, 
    required this.age, 
    required this.height
  }) {
    //{} - в фигурных скобках можно писать код, который будет выполняться при создании объекта
    count++;
  }

  static int count = 0;
  
  String name;
  int age;
  final double height;
}