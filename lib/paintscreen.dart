import "package:flutter/material.dart";
import "package:socket_io_client/socket_io_client.dart" as IO;

class PaintScreen extends StatefulWidget {
  final Map data;
  final String stringFrom;
  const PaintScreen({super.key,required this.data, required this.stringFrom});
  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {

  late IO.Socket _socket;
  @override
  void initState() {
    super.initState();
    connect(); 
  }
  // Socket io connection
  void connect() {
    _socket = IO.io("http://10.3.2.55:3000",<String, dynamic> {
      'transports':['websocket'],
      'autoConnect': false,

    });
    _socket.connect();
    if (widget.stringFrom == "createRoom") {
      _socket.emit('create-game',widget.data);
    }
    _socket.onConnect((data) => {
      // print("connected")
      print(widget.data)
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}