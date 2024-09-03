// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  final String? name;
  final String? image;
  final String? description;
  final double? perHourRate;
  String? id;

  CategoryModel({
    this.name,
    this.image,
    this.description,
    this.perHourRate,
    this.id,
  });

  static List<CategoryModel> dummyData = [
    CategoryModel(
        name: 'Painters',
        image:
            'https://waterworldtechnology.com/wp-content/uploads/2024/01/Painting-Service-Image-WATERWORLD-TECHNOLOGY-LIMITED-min.jpg',
        description: 'Any painting related services',
        perHourRate: 100.00),
    CategoryModel(
        name: 'Capentry',
        image:
            'https://www.constructionjobsireland.ie/wp-content/uploads/2024/01/carpentry.jpg',
        description: 'Any capentry related services',
        perHourRate: 72.00),
    
  ];

  CategoryModel copyWith({
    String? name,
    String? image,
    String? description,
    double? perHourRate,
    String? id,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      perHourRate: perHourRate ?? this.perHourRate,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'description': description,
      'perHourRate': perHourRate,
      'id': id,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      perHourRate:
          map['perHourRate'] != null ? map['perHourRate'] as double : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(name: $name, image: $image, description: $description, perHourRate: $perHourRate, id: $id)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.description == description &&
        other.perHourRate == perHourRate &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        perHourRate.hashCode ^
        id.hashCode;
  }
}
