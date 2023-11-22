import 'package:app/models/roomModel.dart';
import 'package:app/pages/roomDetail.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final RoomModel room;
  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RoomDetail(room: room)),
      ),
      child: ListTile(
        title: Text("Room: ${room.roomName}"),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Owner Name: ${room.ownerName}"),
                Text("Owner ID: ${room.ownerId}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Room ID: ${room.id}"),
                Text("For ${room.capacity} people"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
