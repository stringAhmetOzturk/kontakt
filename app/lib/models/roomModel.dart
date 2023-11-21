class RoomModel {
  List<Room> rooms;

  RoomModel({
    required this.rooms,
  });
}

class Room {
  int id;
  String roomName;

  Room({
    required this.id,
    required this.roomName,
  });
}
