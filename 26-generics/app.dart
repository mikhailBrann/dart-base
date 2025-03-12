/**
дженерики - впозволяют работать с разными типами данных
без изменения метода реализации
 */

void main() {
  //тип данных определяется в момент создание экземпляра класса, и в последсвии его поменять нельзя
  final stirage = Storage(10);
  //тип переменной можно указать явно
  final storageString = Storage<String>('test');

  storageString.write('test2');

  for(var stor in [stirage, storageString]) {
    print(stor.read());
  }
}

//дженерик класс по договоренност иобозначается <T> - type(тип переменной)
class Storage<T> {
  Storage(this.value);
  T value;

  T read() => value;
  void write(T newValue) =>value = newValue;
}