class FoodModel {
  final String foodId;
  final String name;
  final String description;
  final List<String> ingredients;
  final String imageUrl;
  final String instructions;

  FoodModel({
    required this.foodId,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.imageUrl,
    required this.instructions,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      foodId: json['foodId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
      imageUrl: json['imageUrl'] as String,
      instructions: json['instructions'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodId': foodId,
      'name': name,
      'description': description,
      'ingredients': ingredients,
      'imageUrl': imageUrl,
      'instructions': instructions,
    };
  }
}
