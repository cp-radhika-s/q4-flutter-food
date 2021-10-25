import 'package:json_annotation/json_annotation.dart';

part 'Feed.g.dart';

@JsonSerializable(createToJson: false)
class Feed {
  List<FoodItem> feed;

  Feed({required this.feed});

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class FoodItem {
  FeedDisplay display;
  FeedContent content;

  String get name => display.displayName ?? "";

  String get description => content.description?.text ?? "";

  String get image => display.image;

  List<String> get preparationSteps => content.preparationSteps ?? List.empty();

  String get preparationTime => content.details?.totalTime ?? "";

  int get numServing => content.details?.numberOfServings ?? 1;

  double get rating => content.details?.rating ?? 5;

  FoodItem({required this.display, required this.content});

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class FeedDisplay {
  String? displayName;
  List<String> images;

  String get image => images.isNotEmpty ? images[0] : "";

  FeedDisplay({required this.images});

  factory FeedDisplay.fromJson(Map<String, dynamic> json) =>
      _$FeedDisplayFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class FeedContent {
  FeedDescription? description;
  List<String>? preparationSteps;
  FoodDetail? details;
  FeedContent();
  factory FeedContent.fromJson(Map<String, dynamic> json) =>
      _$FeedContentFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class FeedDescription {
  String? text;

  FeedDescription();

  factory FeedDescription.fromJson(Map<String, dynamic> json) =>
      _$FeedDescriptionFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class FoodDetail {
  String? totalTime;
  int? numberOfServings = 1;
  double? rating = 5.0;

  FoodDetail();

  factory FoodDetail.fromJson(Map<String, dynamic> json) =>
      _$FoodDetailFromJson(json);
}
