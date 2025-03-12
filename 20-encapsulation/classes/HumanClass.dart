/**
у Dart есть особенность:
к приватным полям есть прямой доступ в рамках одного файла, однако
если файл имортится, то доступа к приватному полю нет

приватные поля нельзя использовать в конструкторе и их нужно дополнительно прокидывать
пример:
Human({
required this.name, 
required int age, 
required this.height
}) : _age = age;

_age - приватное поле

доступ к нему через геттеры и сеттеры
int get age => _age;
 */


class Human {
    Human({
        required this.name, 
        required int age, 
        required this.height
    }) : _age = age;
    
    //геттер для доступа к приватному полю
    int get age => _age;
    String get nameAndAge => '$name, $_age';
    //cеттер для доступа к приватному полю
    set age(int ageValue) => _age = ageValue;

    String name;
    int _age;
    final double height;

    void grewUp({int years=1}) {
        _age += years;
    }
}