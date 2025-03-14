import 'dart:math';

void main() async {
    // вариант вызова асинхронных функций через then(вложенный)
    // then дуступен изза того что из Future возвращается Future(это его метод)
    // вариант вызова асинхронных функций через then(вложенный) является антипатерном изза вложенности
    //# makeCoffee(3, delayed: 2).then((sec) =>  makeCoffee(4, delayed: 1));

    //так же Future имеет удобный метод обработки исключений
    //вариант с fetch
    //# makeCoffee(3, delayed: 2).then((sec) =>  makeCoffee(4, delayed: 1)).catchError((error) => print(error));
    // int? secondsDelay = await makeCoffee(3, delayed: 2).then((sec) => sec, onError: (error) => print(error));
    // print('secondsDelay: $secondsDelay');

    //вариант обработки ответа с ограничением по таймауту
    // int randomDelay = Random().nextInt(5) + 1;
    // int? secondsTimeoutDelay = await makeCoffee(3, delayed: randomDelay)
    //     .timeout(Duration(seconds: 3))
    //     .then((sec) => sec, onError: (error) => print(error));
    // print('secondsTimeoutDelay: $secondsTimeoutDelay');

    //вариант ожидания всех запросов в одном
    final resp1 = makeCoffee(1, delayed: 3);
    final resp2 = makeCoffee(2, delayed: 1);
    final resp3 = makeCoffee(3, delayed: 1);
    final result = await Future.wait([resp1, resp2, resp3]);
    print('result: ${result.fold<int>(0, (prev, next) => prev + next)} sec.');
    // функционал microtask всегда выполняется до Future
    Future(() => print('test task1'));
    Future(() => print('test task2'));

    Future.microtask(() => print('test microtask'));
}


/**
Future - практический основной класс для работы с асинхронными операциями в Dart.
 */
Future<int> makeCoffee(int orderNumber, {int delayed = 3}) async {
    print('start making coffee by order:$orderNumber');
    await Future.delayed(Duration(seconds: delayed));
    //имулируем ощибку
    // Random random = Random();
    // int randomNumber = random.nextInt(10) + 1;
    // if (randomNumber > 5) {
    //     throw Exception('Error: coffee is empty');
    // }


    print('coffee by order:$orderNumber is ready on $delayed seconds');
    return delayed;
}