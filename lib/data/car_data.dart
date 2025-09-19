import '../models/car.dart';

final List<Car> sampleCars = [
  Car(
    id: '1',
    brand: 'Toyota',
    model: 'Camry',
    year: 2024,
    body: 'Sedan',
    imageUrl: 'assets/images/toyota_camry.jpg', // локальная картинка
    price: 3699000,
    isNew: true,
  ),
  Car(
    id: '2',
    brand: 'BMW',
    model: 'X5',
    year: 2023,
    body: 'SUV',
    imageUrl: 'https://via.placeholder.com/600x400?text=BMW+X5', // онлайн
    price: 7599000,
    isNew: false,
  ),
  Car(
    id: '3',
    brand: 'Hyundai',
    model: 'Tucson',
    year: 2024,
    body: 'Crossover',
    imageUrl: 'assets/images/hyundai_tucson.jpg',
    price: 2699000,
    isNew: true,
  ),
  Car(
    id: '4',
    brand: 'Kia',
    model: 'Rio',
    year: 2022,
    body: 'Hatchback',
    imageUrl: 'assets/images/kia_rio.jpg',
    price: 999000,
    isNew: false,
  ),
];
