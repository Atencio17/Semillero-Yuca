import 'package:flutter/material.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});
  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo, puedes remplazar estos datos con tu lógica
    final List<Map<String, String>> historial = [
      {'nombre': 'Plaga 1', 'fecha': '2024-05-01'},
      {'nombre': 'Plaga 2', 'fecha': '2024-05-05'},
      {'nombre': 'Plaga 3', 'fecha': '2024-05-10'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Plagas'),
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
          itemCount: historial.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: ListTile(
                leading: Icon(
                  Icons.bug_report,
                  color: Color(0xFF99BC85),
                  size: 40.0,
                ),
                title: Text(
                  historial[index]['nombre']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  historial[index]['fecha']!,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF99BC85),
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
