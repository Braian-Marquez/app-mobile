import 'package:flutter/material.dart';
import 'package:flutter_application/services/api_service.dart';
import 'package:flutter_application/screens/welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () async {
                final String email = emailController.text.trim();
                final String password = passwordController.text.trim();
                print('Iniciando sesión...');
                var result = await apiService.login(email, password);
                bool success = result['success'];
                String name = result['name'];

                print('Inicio de sesión completado: $success');

                if (success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WelcomeScreen(
                            name)), // Pasa el nombre a la pantalla de bienvenida
                  );
                } else {
                  // Mostrar mensaje de error
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
