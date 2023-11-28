import 'package:app/features/rooms/data/models/roomModel.dart';
import 'package:app/features/rooms/presentation/pages/roomDetail.dart';
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
          title: Text(
            "Room: ${room.roomName}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          subtitle: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Owner Name: ${room.ownerName}",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Owner ID: ${room.ownerId}",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Room ID: ${room.id}",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "For ${room.capacity} people",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.all(16.0), // Adjust as needed
        ));
  }
}
