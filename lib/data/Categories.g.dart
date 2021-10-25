// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(
    (json['browse-categories'] as List<dynamic>)
        .map((e) => FoodCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['shopping-categories'] as List<dynamic>)
        .map((e) => FoodCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

FoodCategory _$FoodCategoryFromJson(Map<String, dynamic> json) {
  return FoodCategory(
    CategoryDisplay.fromJson(json['display'] as Map<String, dynamic>),
  );
}

CategoryDisplay _$CategoryDisplayFromJson(Map<String, dynamic> json) {
  return CategoryDisplay(
    json['displayName'] as String,
    json['categoryImage'] as String,
  );
}
