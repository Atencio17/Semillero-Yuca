import 'package:flutter/material.dart';
import 'package:semillero/descripcion.dart';
import 'package:semillero/Historial.dart';
import 'package:semillero/Informacion.dart';
import 'package:semillero/Foro.dart';
import 'package:semillero/utils/api.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          backgroundColor:
              Color(0xFF99BC85), // Color verde especificado para el header
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre el menú lateral
                },
              ),
            ),
          ],
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
        drawer: Builder(
          builder: (context) {
            return Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(
                          0xFF99BC85), // Utiliza el color verde para el encabezado del menú
                    ),
                    child: Text(
                      'Opciones',
                      style: TextStyle(
                        color: Colors
                            .white, // Color del texto en el encabezado del menú
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Historial'),
                    onTap: () {
                      Navigator.pop(context); // Cierra el menú
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Historial()),
                      ); // Navega a la pantalla de historial
                    },
                  ),
                  ListTile(
                    title: Text('Foro'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Foro()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Información'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Informacion()),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        body: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MyAPI api = MyAPI();
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'content': _controller.text});
    });

    try {
      String response = await api.sendMessage(_controller.text);
      setState(() {
        _messages.add({'role': 'system', 'content': response});
      });
    } catch (e) {
      setState(() {
        _messages.add({'role': 'system', 'content': 'Error: $e'});
      });
    } finally {
      _controller.clear();
    }
  }

  void _handlePlague() {
    // Navegar a la pantalla de detalles de la plaga
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => detallesDelaPlaga()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            color: Colors.grey[100],
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                final isUserMessage = message['role'] == 'user';
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color:
                          isUserMessage ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(message['content'] ?? ''),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _handlePlague,
                child: Text(
                  'Es mi plaga',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF99BC85),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón "No es mi plaga"
                },
                child: Text(
                  'No es mi plaga',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF99BC85),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Escribe un mensaje...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: _sendMessage,
                child: Text('Enviar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF99BC85),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
