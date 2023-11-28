class UserModel {
  String id;
  String username;
  String password;
  String email;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "username": username,
        "password": password,
        "email": email,
      };
}
