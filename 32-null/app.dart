void main() {
    //? у переменной разрешает создание переменной с типом null без обязательного присвоения значения,
    // тоесть при таком синтаксисе мы говорим что это может быть либо строкаЮ либо ничего
    String? name;
    print(name);

    final storageString = Storage<String>();
    print(storageString.read());
    storageString.write('Hello');
    print(storageString.read());
}


//пример nullable дженерика
class Storage<T> {
    Storage({this.value});
    T? value;

    T? read() => value;
    void write(T? value) => this.value = value;
}