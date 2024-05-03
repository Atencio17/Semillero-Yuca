import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
          backgroundColor: Color(0xFF99BC85), // Color verde especificado para el header
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF99BC85), // Utiliza el color verde para el encabezado del menú
                ),
                child: Text(
                  'Opciones',
                  style: TextStyle(
                    color: Colors.white, // Color del texto en el encabezado del menú
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Historial'),
                onTap: () {
                  Navigator.pop(context); // Cierra el menú
                },
              ),
            ],
          ),
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
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add(messageText);
        _messageController.clear();
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Escriba la descripción de la enfermedad de la planta'),
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
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.grey[100],
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: ListTile(
                    title: Text(
                      _messages[index],
                      textAlign: TextAlign.right,
                    ),
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
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Escribe un mensaje...',
                    filled: true,
                    fillColor: Color(0xFF99BC85),
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

class detallesDelaPlaga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Plaga'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí puedes colocar la imagen y la descripción de la plaga
            Text(
              'Detalles de la Plaga', // Placeholder para la descripción de la plaga
              style: TextStyle(fontSize: 24),
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