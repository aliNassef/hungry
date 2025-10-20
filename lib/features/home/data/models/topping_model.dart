class ToppingModel {
  final int id;
  final String name;
  final String image;
  const ToppingModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ToppingModel.fromJson(Map<String, dynamic> json) {
    return ToppingModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  static List<ToppingModel> dummy = [
    const ToppingModel(
      id: 1,
      name: 'Tomato',
      image: 'http://sonic-zdi0.onrender.com/storage/sides/coleslaw.png',
    ),
    const ToppingModel(
      id: 2,
      name: 'Lettuce',
      image: 'http://sonic-zdi0.onrender.com/storage/sides/coleslaw.png',
    ),
    const ToppingModel(
      id: 3,
      name: 'Cheese',
      image: 'http://sonic-zdi0.onrender.com/storage/sides/coleslaw.png',
    ),
  ];
}
