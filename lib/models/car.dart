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
