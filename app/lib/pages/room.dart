import 'dart:convert';

import 'package:app/models/roomModel.dart';
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

  Future<void> createRoom() async {
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
        print("created");
        setState(() {});
      } else {
        print("Response error!");
      }
    } catch (e) {
      print(e);
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
        onPressed: () => createRoom(),
      ),
    );
  }
}
