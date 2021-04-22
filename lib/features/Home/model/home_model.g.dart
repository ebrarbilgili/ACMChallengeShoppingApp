// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    key: json['key'] as String?,
    description: json['description'] as String?,
    isLike: json['isLike'] as bool?,
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    star: (json['star'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'key': instance.key,
      'description': instance.description,
      'isLike': instance.isLike,
      'name': instance.name,
      'price': instance.price,
      'star': instance.star,
    };
