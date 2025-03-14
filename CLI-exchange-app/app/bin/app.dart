import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main(List<String> arguments) async {
  if(arguments.length != 3) {
    print('Неверный формат вызова!');
    print('Пример: dart bin/app.dart USD EUR 25');
    return;
  }
  if(arguments[0] == arguments[1]) {
    print('Валюты не должны совпадать!');
    return;
  }
  if(double.tryParse(arguments[2]) == null) {
    print('Неверный формат числа!');
    return;

  }

  final from = arguments[0];
  final to = arguments[1];
  final amount = double.parse(arguments[2]);

  print('Операция: $amount $from в $to');
  print('Ожидайте...');

  final requestData = await Currency.setConvertCurrencyFromTo(from, to, amount);
  final result = ConvertData.getMapFromString(requestData);
  print('Результат: ${result['result']}');
}


class Currency {
  static const String apiKey = '3e5dbdec7a1e8c70fa9521d43602583d';
  static const String sheme = 'https';
  static const String host = 'api.exchangerate.host';

  static Future<String> setConvertCurrencyFromTo(String from, String to, double amount) async {
    final uri = Uri(
      scheme: sheme,
      host: host,
      path: 'convert',
      queryParameters: {
        'from': from,
        'to': to,
        'amount': amount.toString(),
        'access_key': apiKey
      }
    );
    final response = await http.get(uri);

    return response.body;
  }
}

class ConvertData {
  static Map<String, dynamic> getMapFromString(String dataString) {
    final dataMap = JsonDecoder().convert(dataString) as Map<String, dynamic>;
    return dataMap;
  }
}