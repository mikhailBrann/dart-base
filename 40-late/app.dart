import 'dart:math';

void main() {
    final user = User(
        height: 1.8,
        weight: 80,
    );
    print(user.bmi);
}

/**
late - тип переменной, которая будет инициализирована позже
например он позволяет инициализировать переменную в конструкторе, что в свою очередь
позволяет избежать лишних вычеслений и геттеров
 */

class User {
    User({
        required this.height,
        required this.weight,
    }) {
        bmi = weight / pow(height, 2);
    }

    final double height;
    final double weight;
    // хорошей практикой будет если вы уверены, что вы ее проиницализуете, иначе лучше использовать nulable переменные в коде
    late final double bmi;
}