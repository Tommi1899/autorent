import 'package:flutter/material.dart';
import 'auth/login_page.dart';
import 'widgets/car_card.dart';
import 'data/car_data.dart';
import 'models/car.dart';

void main() {
  runApp(CarShowroomApp());
}

class CarShowroomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Автосалон',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF1E40AF), // основной цвет (индиго)
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Верхнее меню (AppBar)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Логотип
            Image.asset('assets/logo.png', height: 40),

            // Главное меню
            Row(
              children: [
                TextButton(onPressed: () {}, child: Text("Автосалон")),
                TextButton(onPressed: () {}, child: Text("Сервис")),
                TextButton(onPressed: () {}, child: Text("Каталог")),
                TextButton(onPressed: () {}, child: Text("Лента")),
                TextButton(onPressed: () {}, child: Text("Прайс-лист")),
                TextButton(onPressed: () {}, child: Text("Тест-драйв")),
                TextButton(onPressed: () {}, child: Text("Отзывы")),
              ],
            ),

            // Иконки справа
            Row(
              children: [
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                IconButton(icon: Icon(Icons.compare_arrows), onPressed: () {}),
                IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
                IconButton(
                  icon: Icon(Icons.notifications_none),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person_outline),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),

      // Основной контент — сетка машин
      body: GridView.count(
        crossAxisCount: 2, // две карточки в ряд
        childAspectRatio: 0.75,
        padding: EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: sampleCars.map((c) {
          return CarCard(
            car: c,
            onTap: () {
              print("Открыта машина: ${c.brand} ${c.model}");
            },
          );
        }).toList(),
      ),
    );
  }
}
