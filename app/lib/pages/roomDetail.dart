import 'package:app/models/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class RoomDetail extends StatefulWidget {
  final RoomModel room;
  const RoomDetail({super.key, required this.room});

  @override
  State<RoomDetail> createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  @override
  void initState() {
    super.initState();
    initializeSocket();
  }

  Future<void> initializeSocket() async {
    try {
      IO.Socket socket = IO.io('http://10.0.2.2:5001', <String, dynamic>{
        "transports": ["websocket"],
        // "autoConnect": false
      });
      // socket.connect();
      socket.onConnect((_) {
        print('connected');
      });
      socket.on('event', (data) => print(data));
    } catch (e) {
      print('Error initializing socket: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.room.roomName),
      ),
      body: Center(
        child: Text(widget.room.id),
      ),
    );
  }
}
