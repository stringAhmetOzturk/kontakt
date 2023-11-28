import 'dart:convert';
import 'package:app/features/rooms/presentation/pages/roomDetail.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:app/features/rooms/data/models/roomModel.dart';
import 'package:app/features/rooms/presentation/widgets/roomCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String userId;
  const HomePage({super.key, required this.userId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeSocket();
  }

  Future<void> initializeSocket() async {
    try {
      // IO.Socket socket = IO.io('http://10.0.2.2:5001', <String, dynamic>{
      IO.Socket socket = IO.io('http://localhost:5001', <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false
      });
      socket.connect();
      socket.emit("signin", widget.userId);
      socket.onConnect((_) {
        print('connected');
      });
    } catch (e) {
      print('Error initializing socket: $e');
    }
  }

  Future<List<RoomModel>> fetchRooms() async {
    try {
      var res = await http
          // .get(Uri.parse("http://10.0.2.2:5001/api/rooms/getAllRoom"));
          .get(Uri.parse("http://localhost:5001/api/rooms/getAllRoom"));

      if (res.statusCode == 200) {
        return roomModelFromMap(res.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<RoomModel?> createRoom() async {
    try {
      var res = await http
          // .post(Uri.parse("http://10.0.2.2:5001/api/rooms/createRoom"),
          .post(Uri.parse("http://localhost:5001/api/rooms/createRoom"),
              body: jsonEncode({
                "ownerName": "testAhmet",
                "ownerId": 1,
                "capacity": 10,
                "roomName": "Tatil bitti kontakt"
              }),
              headers: {"content-type": "application/json"});
      if (res.statusCode == 200) {
        setState(() {});
        return RoomModel.fromMap(json.decode(res.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kontakt"),
      ),
      body: FutureBuilder<List<RoomModel>>(
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("Error");
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No rooms found.'));
                }

                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        RoomCard(room: snapshot.data![index]));
            }
          },
          future: fetchRooms()),
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Create a room'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  var room = await createRoom();
                  Navigator.pop(context);

                  if (room != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoomDetail(
                            room: RoomModel(
                                capacity: room.capacity,
                                id: room.id,
                                ownerId: room.ownerId,
                                ownerName: room.ownerName,
                                roomName: room.roomName)),
                      ),
                    );
                  } else {
                    // Handle the case where creating a room failed
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Failed to create a room.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
