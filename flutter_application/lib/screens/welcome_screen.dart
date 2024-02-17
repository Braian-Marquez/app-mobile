import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String name; // Agrega una variable para almacenar el nombre
  
  WelcomeScreen(this.name); // Constructor para inicializar el nombre

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Text('¡Bienvenido, $name!'), // Muestra el nombre en el mensaje de bienvenida
      ),
    );
  }
}

