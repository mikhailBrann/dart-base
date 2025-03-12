//явное и не явное приведение типов

void main() {
  int a = 10;
  int b = 20;

  //явное приведение типов
  double c = a.toDouble() + b.toDouble();
  
  //неявное приведение типов
  //происходит при использовании ключевого слова as
  double d = a.toDouble() + b as double;
  //так же можно оставить это на откуп компилятору
  double e = a.toDouble() + b;

  print([c, d, e]);
}