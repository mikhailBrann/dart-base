void main() async {
    //синхронный вызов функции
    final delayByOrderThree = await makeCoffee(3, delayed: 2);
    final delayByOrderFour = await makeCoffee(4, delayed: 1);

    print('making coffee by orders [3, 4]:${delayByOrderThree + delayByOrderFour} sec.');

    //асинхронный вызов функции
    makeCoffee(1, delayed: 6);
    makeCoffee(2, delayed: 3);
}


/**
асинхронная функция в dart обозначается ключевым словом async
async функция возвращает объект типа Future(я так понимаю это аналог Promise в js)
Future - практический основной класс для работы с асинхронными операциями в Dart.
 */
Future<int> makeCoffee(int orderNumber, {int delayed = 3}) async {
    print('start making coffee by order:$orderNumber');
    await Future.delayed(Duration(seconds: delayed));
    print('coffee by order:$orderNumber is ready on $delayed seconds');
    return delayed;
}