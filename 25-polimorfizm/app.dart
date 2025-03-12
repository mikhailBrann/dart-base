void main() {
  Calculator calc = Calculator();
  print(calc.summ(1, 2));
  /*
  print(calc.summ(1.2, 2)); Error: The argument type 'double' can't be assigned to the parameter type 'int'.
  тут будет выскакивать ошибка, т.к. на вход принимается только int
  решением будет использование типаа num, который может принимать как int, так и double:
  */
  print(calc.summUniversal(1.2, 2));

}


class Calculator {
  int summ(int a, int b) {
    return a + b;
  }

  //пример параметрического полиморфизма в дарт
  num summUniversal(num a, num b) {
    return a + b;
  }
}