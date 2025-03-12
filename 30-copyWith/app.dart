void main() {
  const oleg = Human(name: 'Oleg', age: 20, height: 1.8);
  final andrey = oleg.copyWith(name: 'Andrey', age: 25);

  for(var people in [oleg, andrey]) {
    print(people.nameAndAge);
  }

}

class Human {
    const Human({
        required this.name, 
        required int age, 
        required this.height
    }) : _age = age;
    
    int get age => _age;
    String get nameAndAge => '$name, $_age';

    final String name;
    final int _age;
    final double height;

    /**
    copyWith - метод копирования объекта, с возможным кастомизированием параметров
    который возвращает новый экземпляр класса
    такой метод создает новый объект через конструктор
     */
    Human copyWith({
      String? name,
      int? age,
      double? height
    }) {
      return Human(
        name: name ?? this.name,
        age: age ?? this.age,
        height: height ?? this.height
      );
    }
}