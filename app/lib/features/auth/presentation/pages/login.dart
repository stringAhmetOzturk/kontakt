import 'dart:convert';
import 'package:app/features/auth/presentation/pages/register.dart';
import 'package:app/features/rooms/presentation/pages/room.dart';
import 'package:app/features/auth/data/models/authModel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    analytics.setAnalyticsCollectionEnabled(true);
  }

  void _registerUser() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    try {
      await analytics
          .logEvent(name: "Login", parameters: {"username": username});
      var res =
          await http.post(Uri.parse("http://10.0.2.2:5001/api/auth/login"),
              body: jsonEncode({
                "username": username,
                "password": password,
              }),
              headers: {"content-type": "application/json"});
      if (res.statusCode == 200) {
        var user = UserModel.fromMap(jsonDecode(res.body));

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(userId: user.id),
            ));
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
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage())),
                  child: Text('Register'),
                ),
                ElevatedButton(
                  onPressed: _registerUser,
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
