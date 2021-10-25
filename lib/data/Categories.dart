import 'package:json_annotation/json_annotation.dart';
part 'Categories.g.dart';

@JsonSerializable(createToJson: false)
class Categories {
  @JsonKey(name: "browse-categories")
  List<FoodCategory> browseCats;
  @JsonKey(name: "shopping-categories")
  List<FoodCategory> shoppingCats;

  Categories(this.browseCats, this.shoppingCats);

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

@JsonSerializable(createToJson: false)
class FoodCategory {
  CategoryDisplay display;

  FoodCategory(this.display);

  factory FoodCategory.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryFromJson(json);
}

@JsonSerializable(createToJson: false)
class CategoryDisplay {
  String displayName;
  String categoryImage;

  CategoryDisplay(this.displayName, this.categoryImage);

  factory CategoryDisplay.fromJson(Map<String, dynamic> json) =>
      _$CategoryDisplayFromJson(json);
}
