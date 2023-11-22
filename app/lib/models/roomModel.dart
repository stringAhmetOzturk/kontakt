import 'dart:convert';

List<RoomModel> roomModelFromMap(String str) =>
    List<RoomModel>.from(json.decode(str).map((x) => RoomModel.fromMap(x)));

String roomModelToMap(List<RoomModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class RoomModel {
  String id;
  String roomName;
  String ownerName;
  int ownerId;
  int capacity;

  RoomModel({
    required this.id,
    required this.ownerId,
    required this.ownerName,
    required this.roomName,
    required this.capacity,
  });

  factory RoomModel.fromMap(Map<String, dynamic> json) => RoomModel(
        id: json["_id"],
        roomName: json["roomName"],
        capacity: json["capacity"],
        ownerName: json["ownerName"],
        ownerId: json["ownerId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "roomName": roomName,
        "capacity": capacity,
        "ownerName": ownerName,
        "ownerId": ownerId,
      };
}
