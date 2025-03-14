import 'dart:math';

//stream в dart - это асинхронная последовательность событий
void main() {
    //подписываемся на stream, при такой реализации создается новый stream на каждого подписчика
    // testStream().listen((event) {
    //     print(event);
    // });
    // testStream().listen((event) {
    //     print(event);
    // });

    //для того чтобы подписаться на один и тот же stream используется метод asBroadcastStream при создании стрима
    final broadcastStream = testStream().asBroadcastStream();
    // инициализация  подписки на stream
    final sub1 = broadcastStream.listen((event) =>print(event));
    final sub2 = broadcastStream.listen((event) =>print(event));

    //для предотвращения утечки памяти всегда следует отписываться от stream
    broadcastStream.last.then((_) {
        print('unsubscribe');
        sub1.cancel();
        sub2.cancel();
    });
}

//при создании  stream мы можем указать тип данных, а так же указываем async со знаком *
Stream <int> testStream() async* {
    int sreamId = Random().nextInt(1000) + 1;
    print('$sreamId is started');

    for (int i = 0; i < 3; i++) {
        await Future.delayed(Duration(seconds: 1));
        yield i;
    }
}