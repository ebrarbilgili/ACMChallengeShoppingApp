import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  String? key;
  String? description;
  bool? isLike = false;
  String? name;
  double? price;
  double? star;

  HomeModel({
    this.key,
    this.description,
    this.isLike,
    this.name,
    this.price,
    this.star,
  });

  void isLikePressed() {
    isLike = !isLike!;
  }

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }
}
