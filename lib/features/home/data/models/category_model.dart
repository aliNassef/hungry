class CategoryModel {
  final String name;
  final int id;
  const CategoryModel({required this.name, required this.id});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'], id: json['id']);
  }

  static List<CategoryModel> dummy = [
    const CategoryModel(name: 'All', id: 0),
    const CategoryModel(name: 'Pizza', id: 1),
    const CategoryModel(name: 'Burger', id: 2),
    const CategoryModel(name: 'Hot Dog', id: 3),
    const CategoryModel(name: 'Drink', id: 4),
    const CategoryModel(name: 'Donut', id: 5),
  ];
}
