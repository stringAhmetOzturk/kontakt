import 'package:app/widgets/roomCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  // List<Room> rooms = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRooms();
  }

  Future<void> fetchRooms() async {
    try {
      var res = await http
          .get(Uri.parse("http://10.0.2.2:5001/api/rooms/getAllRoom"));
      if (res.statusCode == 200) {
        print(res.body);
        // RoomModel.fromJson(res.body);
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
          title: Text("Kontakt"),
        ),
        body: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) => RoomCard(
                  roomId: index,
                )));
  }
}
