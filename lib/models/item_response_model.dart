import 'package:pagopa_test/models/label.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item_response_model.g.dart';

@JsonSerializable()
class ItemResponseModel {
  String? kind;
  num id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? acceptedAt;
  String? storyType;
  String? storyPriority;
  String? name;
  String? description;
  String? currentState;
  num? requestedById;
  String? url;
  num? projectId;
  List<dynamic>? ownerIds;
  List<Label>? labels;
  num? ownedById;

  ItemResponseModel(
      {this.kind,
      required this.id,
      this.createdAt,
      this.updatedAt,
      this.acceptedAt,
      this.storyType,
      this.storyPriority,
      this.name,
      this.description,
      this.currentState,
      this.requestedById,
      this.url,
      this.projectId,
      this.ownerIds,
      this.labels,
      this.ownedById});
  /*factory ItemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseModelFromJson(json);*/

  factory ItemResponseModel.fromJson(Map<String, dynamic> data) =>
      _$ItemResponseModelFromJson(data);

  Map<String, dynamic> toJson() => _$ItemResponseModelToJson(this);
}
