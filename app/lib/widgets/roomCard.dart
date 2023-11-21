import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final int roomId;
  const RoomCard({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text("Room ${roomId}"),
      ),
    );
  }
}
