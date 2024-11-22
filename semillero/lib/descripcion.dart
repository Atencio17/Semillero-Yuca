import 'package:flutter/material.dart';

class detallesDelaPlaga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Plaga'),
        backgroundColor: Color(0xFF99BC85),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/plaga1.jpg', // Reemplaza con la URL de la imagen de la plaga
              width: 200, // Ancho deseado de la imagen
              height: 200, // Alto deseado de la imagen
            ),
            SizedBox(height: 20),
            Text(
              'Descripción de la plaga', // Reemplaza con la descripción de la plaga
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresar a la pantalla anterior
              },
              child: Text('Regresar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF99BC85),
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
