import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});
  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo, puedes remplazar estos datos con tu lógica
    final List<Map<String, String>> plagas = [
      {'nombre': 'Plaga 1', 'imagen': 'assets/images/plaga1.jpg'},
      {'nombre': 'Plaga 2', 'imagen': 'assets/images/plaga2.jpg'},
      {'nombre': 'Plaga 3', 'imagen': 'assets/images/plaga3.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Información de Plagas'),
        backgroundColor: Color(0xFF99BC85),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: plagas.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: ListTile(
                leading: Image.asset(
                  plagas[index]['imagen']!,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  plagas[index]['nombre']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                contentPadding: EdgeInsets.all(10.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
