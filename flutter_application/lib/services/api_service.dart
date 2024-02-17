import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = 'https://vps-3849674-x.dattaweb.com/api/v1/auth';

Future<Map<String, dynamic>> login(String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/login'),
    body: jsonEncode({"email": email, "password": password}),
    headers: {'Content-Type': 'application/json'},
  );


    // Procesar la respuesta si es necesario (por ejemplo, extraer el token y el nombre)
    var jsonResponse = json.decode(response.body);
    var token = jsonResponse['token'];
    var name = jsonResponse['name'];
    print('Token de autenticación: $token');

    return {'success': true, 'name': name}; // Devuelve true para indicar un inicio de sesión exitoso junto con el nombre
  
}




  Future<bool> register(String businessName, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register-commerce'),
      body: jsonEncode({"businessName": businessName, "email": email, "password": password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // Procesar la respuesta
      return true;
    } else {
      // Manejar el error
      return false;
    }
  }
}
