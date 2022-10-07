import 'package:json_annotation/json_annotation.dart';
part 'label.g.dart';

@JsonSerializable()
class Label {
  num? id;
  num? projectId;
  String? kind;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  Label({
    this.id,
    this.projectId,
    this.kind,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Label.fromJson(Map<String, dynamic> data) => _$LabelFromJson(data);

  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
