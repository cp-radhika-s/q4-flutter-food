// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
    feed: (json['feed'] as List<dynamic>)
        .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return FoodItem(
    display: FeedDisplay.fromJson(json['display'] as Map<String, dynamic>),
    content: FeedContent.fromJson(json['content'] as Map<String, dynamic>),
  );
}

FeedDisplay _$FeedDisplayFromJson(Map<String, dynamic> json) {
  return FeedDisplay(
    images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  )..displayName = json['displayName'] as String?;
}

FeedContent _$FeedContentFromJson(Map<String, dynamic> json) {
  return FeedContent()
    ..description = json['description'] == null
        ? null
        : FeedDescription.fromJson(json['description'] as Map<String, dynamic>)
    ..preparationSteps = (json['preparationSteps'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..details = json['details'] == null
        ? null
        : FoodDetail.fromJson(json['details'] as Map<String, dynamic>);
}

FeedDescription _$FeedDescriptionFromJson(Map<String, dynamic> json) {
  return FeedDescription()..text = json['text'] as String?;
}

FoodDetail _$FoodDetailFromJson(Map<String, dynamic> json) {
  return FoodDetail()
    ..totalTime = json['totalTime'] as String?
    ..numberOfServings = json['numberOfServings'] as int
    ..rating = (json['rating'] as num).toDouble();
}
