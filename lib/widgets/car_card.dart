import 'package:flutter/material.dart';
import '../models/car.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback? onTap;
  final double cardWidth;
  final double cardHeight;

  const CarCard({
    Key? key,
    required this.car,
    this.onTap,
    this.cardWidth = 560, // ширина карточки
    this.cardHeight = 320, // высота карточки
  }) : super(key: key);

  String formatPrice(int price) {
    return "${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => "${m[1]} ")} ₽";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Верхняя строка
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "Новая",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "Под заказ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Тип + название
              Row(
                children: [
                  Icon(Icons.directions_car, size: 28, color: Colors.grey[700]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "${car.brand} ${car.model}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Фото машины
              Expanded(
                child: Center(
                  child: car.imageUrl.startsWith('http')
                      ? Image.network(
                          car.imageUrl,
                          fit: BoxFit.contain,
                          height: 120,
                        )
                      : Image.asset(
                          car.imageUrl,
                          fit: BoxFit.contain,
                          height: 120,
                        ),
                ),
              ),

              const SizedBox(height: 10),

              // Цена
              Text(
                formatPrice(car.price),
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 6),

              // Характеристики
              Wrap(
                spacing: 20,
                runSpacing: 8,
                children: [
                  _buildSpec(Icons.speed, "до 100 км/ч", "7.5 сек"),
                  _buildSpec(Icons.settings, "Двигатель", "250 л.с."),
                  _buildSpec(Icons.settings_input_component, "Привод", "4WD"),
                ],
              ),

              const Spacer(),

              // Кнопки
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.compare_arrows),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "ПОДРОБНЕЕ",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_right_alt, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpec(IconData icon, String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
