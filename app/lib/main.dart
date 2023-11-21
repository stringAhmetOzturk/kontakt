import 'package:app/pages/room.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kontakt', debugShowCheckedModeBanner: false, home: RoomPage());
  }
}
