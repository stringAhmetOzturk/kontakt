import 'dart:convert';

import 'package:app/models/roomModel.dart';
import 'package:app/pages/roomDetail.dart';
import 'package:app/widgets/roomCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  Future<List<RoomModel>> fetchRooms() async {
    try {
      var res = await http
          .get(Uri.parse("http://10.0.2.2:5001/api/rooms/getAllRoom"));

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
          .post(Uri.parse("http://10.0.2.2:5001/api/rooms/createRoom"),
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
