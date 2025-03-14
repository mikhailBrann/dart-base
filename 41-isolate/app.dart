import 'dart:isolate';
/**
isolate - это тред в dart
dart тоже однопоточный язык, но есть возможность запускать изоляты
изоляты могут обмениваться данными через порты, на прямую доступа к памяти нет
 */

 Future <void> main() async {
    /**
    метод spawn - запускает изолят, передает туда коллбек-функцию(точка входа) и аргументы
    механизмы resivePort и sendPort - это механизмы для обмена данными между изолятами
     */
    //Isolate.spawn(sayHello, 'Bob');
    final numberList = List<int>.generate(20, (index) => index + 1);
    final isolateCounts = 4;
    final mainResultList = <int>[];
    //создаем один порт на все изоляты
    final receivePort = ReceivePort();
    var complitedIsolates = 0;

    //тут создаем изоляты и запускаем их работу
    for (var i = 0; i < isolateCounts; i++) {
        final stepSize = numberList.length ~/ isolateCounts;
        final sublist = numberList.sublist(i * stepSize, (i + 1) * stepSize);

        Isolate.spawn(mathGetOperationNumbersList, [sublist, receivePort.sendPort, i]);
    }

    //тут мы получаем данные из изолятов и обрабатываем их, когда все изоляты отработали, мы закрываем порт
    await for (final data in receivePort) {
        mainResultList.addAll(data as List<int>);
        complitedIsolates++;

        if (complitedIsolates == isolateCounts) {
            mainResultList.sort();
            print('Результат:\n$mainResultList');
            receivePort.close();
            break;
        }
    }
 }


 void mathGetOperationNumbersList(List<dynamic> args) async {
    final numbers = args[0] as List<int>;
    final sendPort = args[1] as SendPort;
    final isolateIndex = args[2] as int;
    final resultList = <int>[];

    await Future.delayed(Duration(seconds: 5));

    for (final elem in numbers) {
        final result = elem * elem;
        resultList.add(result);
        print('Результат: $result из изолята $isolateIndex');
    }

    //возвращаем через порт результат вычислений из изолята
    sendPort.send(resultList);
    print('изолят $isolateIndex закончил работу');
 }