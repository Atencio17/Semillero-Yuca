import 'package:flutter/material.dart';

class Foro extends StatefulWidget {
  @override
  _ForoState createState() => _ForoState();
}

class _ForoState extends State<Foro> {
  TextEditingController _questionController = TextEditingController();
  List<Map<String, dynamic>> _questions = [
    {
      'pregunta': '¿Cómo identificar esta plaga?',
      'respuestas': ['Podrías revisar el color y tamaño de los insectos.']
    },
    {
      'pregunta': '¿Qué tratamiento es efectivo?',
      'respuestas': ['He usado aceite de neem y ha funcionado bien.']
    },
  ];

  void _addQuestion() {
    String questionText = _questionController.text.trim();
    if (questionText.isNotEmpty) {
      setState(() {
        _questions.add({'pregunta': questionText, 'respuestas': []});
        _questionController.clear();
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor escribe una pregunta.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _addResponse(int index, String responseText) {
    if (responseText.isNotEmpty) {
      setState(() {
        _questions[index]['respuestas'].add(responseText);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foro de Plagas'),
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: ListTile(
                      title: Text(
                        _questions[index]['pregunta'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ..._questions[index]['respuestas'].map<Widget>((respuesta) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(respuesta),
                            );
                          }).toList(),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Escribe una respuesta...',
                            ),
                            onSubmitted: (responseText) {
                              _addResponse(index, responseText);
                            },
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _questionController,
                      decoration: InputDecoration(
                        hintText: 'Haz una pregunta...',
                        filled: true,
                        fillColor: Color(0xFF99BC85).withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: _addQuestion,
                    child: Text('Enviar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF99BC85),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
