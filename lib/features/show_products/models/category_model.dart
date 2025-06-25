// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String name;
  CategoryModel({required this.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'] as String);
  }
}
