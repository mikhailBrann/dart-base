import 'dart:math';

void main() {
    //?? - оператор объединения с null
    String? login = someFetchFunc();
    String result = login ?? 'Unknown user';
    print(result);
}


//пример nullable дженерика
String? someFetchFunc() {
    Random random = Random();

    int randomNumber = random.nextInt(10) + 1;

    if (randomNumber > 5) {
        return 'User_${randomNumber}';
    }

    return null;
}