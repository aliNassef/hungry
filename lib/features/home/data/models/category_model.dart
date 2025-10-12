class CategoryModel {
  final String name;
  final int id;
  const CategoryModel({required this.name, required this.id});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'], id: json['id']);
  }


  static List<CategoryModel> dummy = [
    CategoryModel(name: 'All', id: 0),
    CategoryModel(name: 'Pizza', id: 1),
    CategoryModel(name: 'Burger', id: 2),
    CategoryModel(name: 'Hot Dog', id: 3),
    CategoryModel(name: 'Drink', id: 4),
    CategoryModel(name: 'Donut', id: 5),
  ];
}
