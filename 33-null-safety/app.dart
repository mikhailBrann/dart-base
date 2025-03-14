import 'dart:math';

void main() {
    //null safety - это по сути концепция проверки на null, если мы точно не знаем придет ли значение, 
    // нужно результат проверять на неравность null

    final result = someFetchFunc();

    if(result != null) {
        print(result);
    } else {
        print('Error! try again');
    }
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