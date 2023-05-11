import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de...'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.developer_board,
              size: 100,
              color: Colors.green,
            ),
            Divider(),
            Text('Desarrollado en Flutter por: \n Harold Julio Flores Suazo'),
            Divider(),
            Text(
              'Ingeniero de Ejecución en Informática mención Desarrollo de sistemas',
              style: TextStyle(fontSize: 8),
            ),
            Divider(),
            Text(
              'Esta APP utiliza conexion a: \n https://api.libreapi.cl/  \n \n Utilizando los packages : \n \n get: ^4.6.5 \n flutter_easyloading: ^3.0.5 \n  dio: ^5.1.2',
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
