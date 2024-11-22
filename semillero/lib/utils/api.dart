import 'dart:convert';
import 'package:http/http.dart' as http;

class MyAPI {
  static const String baseUrl = 'https://semilleroapi.onrender.com';

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/chatIA'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'inputMessage': message}),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody.containsKey('answer')) {
          return responseBody['answer'];
        } else {
          throw Exception('La respuesta no contiene el mensaje esperado.');
        }
      } else {
        throw Exception('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
      throw Exception('Fallo al enviar el mensaje: $e');
    }
  }
}
