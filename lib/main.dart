import 'package:flutter/material.dart';

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
          seedColor: Color(0xFF1E40AF), // primary — indigo
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Простые модели данных для примера
class Car {
  final String id;
  final String brand;
  final String model;
  final int year;
  final String body;
  final String imageUrl;
  final int price; // в рублях
  final bool isNew;

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.body,
    required this.imageUrl,
    required this.price,
    required this.isNew,
  });
}

final List<Car> sampleCars = [
  Car(
    id: '1',
    brand: 'Toyota',
    model: 'Camry',
    year: 2024,
    body: 'Sedan',
    imageUrl: 'https://via.placeholder.com/600x400?text=Toyota+Camry',
    price: 3699000,
    isNew: true,
  ),
  Car(
    id: '2',
    brand: 'BMW',
    model: 'X5',
    year: 2023,
    body: 'SUV',
    imageUrl: 'https://via.placeholder.com/600x400?text=BMW+X5',
    price: 7599000,
    isNew: false,
  ),
  Car(
    id: '3',
    brand: 'Hyundai',
    model: 'Tucson',
    year: 2024,
    body: 'Crossover',
    imageUrl: 'https://via.placeholder.com/600x400?text=Hyundai+Tucson',
    price: 2699000,
    isNew: true,
  ),
  Car(
    id: '4',
    brand: 'Kia',
    model: 'Rio',
    year: 2022,
    body: 'Hatchback',
    imageUrl: 'https://via.placeholder.com/600x400?text=Kia+Rio',
    price: 999000,
    isNew: false,
  ),
  // добавь ещё при необходимости
];

// HomePage — главный экран с Hero и каталогом
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  List<Car> get filteredCars {
    if (_searchQuery.trim().isEmpty) return sampleCars;
    final q = _searchQuery.toLowerCase();
    return sampleCars.where((c) {
      return c.brand.toLowerCase().contains(q) ||
          c.model.toLowerCase().contains(q) ||
          c.year.toString().contains(q);
    }).toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Автосалон'),
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              // звонок — заглушка
            },
            tooltip: 'Позвонить',
          ),
          IconButton(
            icon: Icon(Icons.account_circle_outlined),
            onPressed: () {},
            tooltip: 'Личный кабинет',
          ),
        ],
      ),
      drawer: _buildFilterDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            _buildHero(context),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: _buildSearchBar(),
            ),
            Expanded(child: _buildCatalog()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Каталог'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Акции',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Контакты'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Записаться на тест-драйв — заглушка
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Тест‑драйв'),
              content: Text('Форма записи — можно расширить.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Закрыть'),
                ),
              ],
            ),
          );
        },
        label: Text('Тест‑драйв'),
        icon: Icon(Icons.directions_car),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Новые авто в наличии',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 8),
                Text(
                  'Цены от производителя. Рассчитать кредит или записаться на тест‑драйв.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Каталог')),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('Рассчитать кредит'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://via.placeholder.com/320x200?text=Hero+Car',
              width: 160,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Поиск: марка, модель или год',
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        isDense: true,
      ),
      onChanged: (v) => setState(() => _searchQuery = v),
    );
  }

  Widget _buildCatalog() {
    final cars = filteredCars;
    if (cars.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 56),
            SizedBox(height: 8),
            Text('По запросу ничего не найдено'),
            SizedBox(height: 8),
            TextButton(
              onPressed: () => setState(() => _searchQuery = ''),
              child: Text('Сбросить фильтры'),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 900
              ? 3
              : (MediaQuery.of(context).size.width > 600 ? 2 : 1),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 16 / 9,
        ),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return CarCard(car: car, onTap: () => _openCarDetails(car));
        },
      ),
    );
  }

  void _openCarDetails(Car car) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CarDetailsPage(car: car)),
    );
  }

  Widget _buildFilterDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Фильтры',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Состояние'),
                    subtitle: Text('Новые / Б/у'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Цена'),
                    subtitle: Text('от — до'),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Марка'),
                    subtitle: Text('Toyota, BMW, Hyundai…'),
                    onTap: () {},
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Применить'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Компонент карточки авто
class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback onTap;

  const CarCard({required this.car, required this.onTap});

  String formatPrice(int price) {
    // простое форматирование
    final s = price.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final pos = s.length - i;
      buffer.write(s[i]);
      if (pos % 3 == 1 && i != s.length - 1) buffer.write('\u00A0'); // NBSP
    }
    return buffer.toString() + ' ₽';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(car.imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        car.isNew ? 'Новый' : 'Б/у',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${car.brand} ${car.model}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${car.year} • ${car.body}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatPrice(car.price),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'от ${(car.price / 60).round()} ₽/мес',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Страница деталей авто
class CarDetailsPage extends StatelessWidget {
  final Car car;

  const CarDetailsPage({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${car.brand} ${car.model}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                car.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${car.brand} ${car.model}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 4),
                    Text('${car.year} • ${car.body}'),
                  ],
                ),
                Text(
                  '${car.price} ₽',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.payment),
                    label: Text('Рассчитать кредит'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.directions_car),
                    label: Text('Тест‑драйв'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Характеристики',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            _specRow('Двигатель', '2.0 L, бензин'),
            _specRow('Мощность', '199 л.с.'),
            _specRow('Коробка', 'Автомат'),
            _specRow('Привод', 'Передний'),
            SizedBox(height: 16),
            Text('Описание', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 8),
            Text(
              'Полное описание автомобиля, его комплектации, истории обслуживания и дополнительных опций. Здесь можно добавить буллеты преимуществ.',
            ),
            SizedBox(height: 20),
            Text(
              'Похожие авто',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final c = sampleCars[index % sampleCars.length];
                  return SizedBox(
                    width: 220,
                    child: CarCard(
                      car: c,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CarDetailsPage(car: c),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _specRow(String k, String v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(k, style: TextStyle(color: Colors.grey[700])),
          Text(v, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
