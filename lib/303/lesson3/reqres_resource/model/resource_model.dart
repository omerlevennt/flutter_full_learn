import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'resource_model.g.dart';

String _fetchCustom(String data) {
  return 'aa';
}

@JsonSerializable(
  createToJson: false,
)
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   return _$ResourceModelToJson(this);
  // }
}

@JsonSerializable(
  createToJson: false,
  //fieldRename: FieldRename.screamingSnake,
)
class Data extends Equatable {
  final int? id;
  final String? name;
  final int? year;
  @JsonKey(name: 'renk')
  final String? color;
  @JsonKey(fromJson: _fetchCustom)
  final String? pantoneValue;
  final String? price;
  final StatusCode? status;

  const Data(
      {this.id,
      this.name,
      this.year,
      this.color,
      this.pantoneValue,
      this.price,
      this.status});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  @override
  List<Object?> get props => [id, name, price];
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue(500)
  weird
}
