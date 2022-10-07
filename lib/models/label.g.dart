part of 'label.dart';

Label _$LabelFromJson(Map<String, dynamic> json) {
  return Label(
    id: json['id'] as num?,
    projectId: json['project_id'] as num?,
    kind: json['kind'] as String?,
    name: json['name'] as String?,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'kind': instance.kind,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
