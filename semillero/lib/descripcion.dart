import 'package:flutter/material.dart';

class detallesDelaPlaga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Plaga y sugerencias'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/mariogud.jpeg', // Reemplaza con la URL de la imagen de la plaga
              width: 200, // Ancho deseado de la imagen
              height: 200, // Alto deseado de la imagen
            ),
            SizedBox(height: 20),
            Text(
              'Descripción de la plaga sdadasdsadsadasdad', // Reemplaza con la descripción de la plaga
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresar a la pantalla anterior
              },
              child: Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
