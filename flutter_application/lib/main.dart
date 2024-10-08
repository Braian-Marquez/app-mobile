import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/screens/registration_screen.dart';
import 'package:flutter_application/screens/welcome_screen.dart';
import 'package:flutter_application/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Ruta inicial de la aplicación
      routes: {
        '/login': (context) => LoginScreen(), // Pantalla de inicio de sesión
        '/registration': (context) =>
            RegistrationScreen(), // Pantalla de registro
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final APIService apiService =
      APIService(); // Agrega la instancia de APIService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Contenido para registro
           
           // Espacio entre el botón de registro y el formulario de inicio de sesión
            // Contenido para inicio de sesión
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
                // Realiza la autenticación llamando al método login de APIService
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
              SizedBox(
                height:
                    20),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,
                    '/registration'); // Navegar a la pantalla de registro
              },
              child:
                  Text('Registrarse'), // Botón para ir a la página de registro
            ),
          ],
        ),
      ),
    );
  }
}
