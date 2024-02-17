import 'package:flutter/material.dart';
import 'package:flutter_application/services/api_service.dart';


class RegistrationScreen extends StatelessWidget {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: businessNameController, decoration: InputDecoration(labelText: 'Business Name')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () async {
                final String businessName = businessNameController.text.trim();
                final String email = emailController.text.trim();
                final String password = passwordController.text.trim();
                bool success = await apiService.register(businessName, email, password);
                if (success) {
                  // Navegar a la siguiente pantalla después del registro
                } else {
                  // Mostrar mensaje de error
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
