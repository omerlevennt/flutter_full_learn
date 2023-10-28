// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceModel _$ResourceModelFromJson(Map<String, dynamic> json) =>
    ResourceModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      name: json['name'] as String?,
      year: json['year'] as int?,
      color: json['renk'] as String?,
      pantoneValue: _fetchCustom(json['pantoneValue'] as String),
      price: json['price'] as String?,
      status: $enumDecodeNullable(_$StatusCodeEnumMap, json['status']),
    );

const _$StatusCodeEnumMap = {
  StatusCode.success: 200,
  StatusCode.weird: 500,
};
