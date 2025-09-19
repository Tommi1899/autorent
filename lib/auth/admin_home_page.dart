import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  final String adminName;

  const AdminHomePage({required this.adminName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Админ-панель ($adminName)')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Добавить автомобиль'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Удалить автомобиль'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Просмотр заявок на тест-драйв'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Просмотр заявок на аренду'),
          ),
        ],
      ),
    );
  }
}
