class MealModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final String rating;
  final String price;
  final bool isFavorite;

  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
    required this.isFavorite,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      rating: json['rating'],
      price: json['price'],
      isFavorite: json['is_favorite'],
    );
  }

  static List<MealModel> dummy = [
    MealModel(
      id: 1,
      name: 'Vegan Salad Bowl',
      description: 'A delicious bowl of fresh vegetables and greens.',
      image: 'assets/images/meal1.png',
      rating: '4.5',
      price: '\$12.99',
      isFavorite: false,
    ),
    MealModel(
      id: 2,
      name: 'Grilled Chicken',
      description: 'Juicy grilled chicken with herbs and spices.',
      image: 'assets/images/meal2.png',
      rating: '4.7',
      price: '\$15.99',
      isFavorite: true,
    ),
    MealModel(
      id: 3,
      name: 'Pasta Primavera',
      description: 'Pasta with fresh vegetables in a light sauce.',
      image: 'assets/images/meal3.png',
      rating: '4.6',
      price: '\$13.99',
      isFavorite: false,
    ),
    MealModel(
      id: 4,
      name: 'Avocado Toast',
      description: 'Toasted bread topped with mashed avocado and seasonings.',
      image: 'assets/images/meal4.png',
      rating: '4.4',
      price: '\$10.99',
      isFavorite: true,
    ),
    MealModel(
      id: 5,
      name: 'Fruit Smoothie',
      description: 'A refreshing blend of fruits and yogurt.',
      image: 'assets/images/meal5.png',
      rating: '4.8',
      price: '\$8.99',
      isFavorite: false,
    ),
    MealModel(
      id: 6,
      name: 'Veggie Wrap',
      description: 'A healthy wrap filled with fresh vegetables and hummus.',
      image: 'assets/images/meal6.png',
      rating: '4.3',
      price: '\$11.99',
      isFavorite: true,
    ),
  ];
}
