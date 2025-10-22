class SlideOptionModel {
  final int id;
  final String name;
  final String image;
  const SlideOptionModel({
    required this.id,
    required this.name,
    required this.image,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
  factory SlideOptionModel.fromJson(Map<String, dynamic> json) {
    return SlideOptionModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
  static List<SlideOptionModel> dummy = [
    const SlideOptionModel(
      id: 1,
      name: 'Tomato',
      image: 'http://sonic-zdi0.onrender.com/storage/sides/coleslaw.png',
    ),
    const SlideOptionModel(
      id: 2,
      name: 'Lettuce',
      image: 'http://sonic-zdi0.onrender.com/storage/sides/coleslaw.png',
    ),
    const SlideOptionModel(
      id: 3,
      name: 'Cheese',
      image: 'http://sonic-zdi0.onrender.com/storage/sides/coleslaw.png',
    ),
  ];
}
