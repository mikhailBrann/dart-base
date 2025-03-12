void main() {
  final sanya = Human(name: "Саня",age: 23,height: 190);
  final shihkin = Artist(name: "Шишкин",age: 23,height: 190,style: "Реализм");
  final enzoFerrari = Mechanic(name: "Энцо Феррари",age: 23,height: 190, category: "Двигатели");
  final progojin = Cook(name: "Пригожин", age: 40, height: 190, level: "Придворный Шефповар");

  for(Human human in [sanya, shihkin, enzoFerrari, progojin]) {
    print(human);
  }

  shihkin.drawPicture();
  enzoFerrari.repairCar();
  progojin.cookingDeliciousDish();
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
    return 'name: $name, age: $age, height: $height';
  }
}

class Artist extends Human {
    //переопределяем конструктор родителя
    Artist({
        required super.name,
        required super.age,
        required super.height,
        required this.style
    });

    String style;

    void drawPicture() {
        print('${name} рисует картинку');
    }

    @override
    String toString() {
        return '[Художник]' + super.toString() + ', style: $style';
    }
}

class Mechanic extends Human {
    Mechanic({
        required super.name,
        required super.age,
        required super.height,
        required this.category
    });

    String category;

    void repairCar() {
        print('${name} ремонтирует машину');
    }

    @override
    String toString() {
        return '[Механик]' + super.toString() + ', category: $category';
    }
}

class Cook extends Human {
    Cook({
        required super.name,
        required super.age,
        required super.height,
        required this.level
    });

    String level;

    void cookingDeliciousDish() {
        print('${name} готовит вкусную еду');
    }

    @override
    String toString() {
        return '[Повар]'+ super.toString() + ', level: $level';
    }
}