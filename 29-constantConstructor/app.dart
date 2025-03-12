/**
в dart для того, что бы создать контантный объект,
требуется:
внутри класса обявить конструктор через ключевое слово const
а так же все поля должны быть final
 */

void main() {
  const oleg = Human(name: 'Oleg', age: 20, height: 1.8);
  print(oleg.nameAndAge);
}

class Human {
    const Human({
        required this.name, 
        required int age, 
        required this.height
    }) : _age = age;
    
    //геттер для доступа к приватному полю
    int get age => _age;
    String get nameAndAge => '$name, $_age';

    final String name;
    final int _age;
    final double height;
}