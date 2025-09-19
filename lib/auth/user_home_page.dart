import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  final String userName;

  const UserHomePage({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль: $userName')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Купить автомобиль'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Арендовать автомобиль'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Записаться на тест-драйв'),
          ),
        ],
      ),
    );
  }
}
