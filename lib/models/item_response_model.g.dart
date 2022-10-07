part of 'item_response_model.dart';

ItemResponseModel _$ItemResponseModelFromJson(Map<String, dynamic> json) {
  return ItemResponseModel(
    kind: json['kind'] as String?,
    id: json['id'] as num,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    acceptedAt: DateTime.parse(json['accepted_at'] as String),
    storyType: json['story_type'] as String?,
    storyPriority: json['story_priority'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    currentState: json['current_state'] as String?,
    requestedById: json['requested_by_id'] as num?,
    url: json['url'] as String?,
    projectId: json['project_id'] as num?,
    ownerIds: json['owner_ids'] as List<dynamic>?,
    labels: (json['labels'] as List<dynamic>?)
        ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
        .toList(),
    ownedById: json['owned_by_id'] as num?,
  );
}

Map<String, dynamic> _$ItemResponseModelToJson(ItemResponseModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'acceptedAt': instance.acceptedAt,
      'storyType': instance.storyType,
      'storyPriority': instance.storyPriority,
      'name': instance.name,
      'description': instance.description,
      'currentState': instance.currentState,
      'requestedById': instance.requestedById,
      'url': instance.url,
      'projectId': instance.projectId,
      'ownerIds': instance.ownerIds,
      'labels': instance.labels,
      'ownedById': instance.ownedById,
    };
