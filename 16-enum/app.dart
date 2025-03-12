//enum - очень удобная штука, как словарь для хранения данных
enum Pet {
  dog('Собака', 2),
  cat('Кошка', 3),
  bird('Птичка', 1);
  //таким образом можно задать сколько угодно параметров
  const Pet(this.localization, this.age);
  final String localization;
  final num age;

  void printPetInfo() {
    print('питомец: ${this.localization}, возраст: ${this.age}');
  }
}

void main() {
  final vasyaPet = Pet.dog;
  final stasPet = Pet.cat;

  for(var pet in [vasyaPet, stasPet]) {
    pet.printPetInfo();
  }
}