import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String phone;

  const HomeScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenue sur AgriSmart"),
      ),
      body: Center(
        child: Text(
          "Connecté avec : $phone",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
