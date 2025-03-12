void main() {
  final myGame = Game();
  myGame.move();
  myGame.attack();
  myGame.defence();

  print(myGame.score);
}

class Game {
  int score = 0;

  void addScore() {
    score++;
  }

  void move() {
    print('Player move');
    addScore();
  }

  void attack() {
    print('Player attack');
    addScore();
  }
}

//extension - ключевое слово которое позволяет расширить функционал класса, не меня его исходный код
extension GameDefence on Game {
  void defence() {
    print('Player defence');
    addScore();
  }
}