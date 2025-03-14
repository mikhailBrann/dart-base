import 'dart:math';

void main() {
    //? - это оператор так же можно безопасно использовать например для методов строки, когда мы не уверенны что придет строка или null
    String? result = someFetchFunc();
    print(result?.substring(0, 1));
}


//пример nullable дженерика
String? someFetchFunc() {
    Random random = Random();

    int randomNumber = random.nextInt(10) + 1;

    if (randomNumber > 5) {
        return 'Your number: ${randomNumber}';
    }

    return null;
}