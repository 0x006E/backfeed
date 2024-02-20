// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thought _$ThoughtFromJson(Map<String, dynamic> json) => Thought(
      id: _$JsonConverterFromJson<String, ULID>(
          json['id'], const StringULIDConverter().fromJson),
      thought: json['thought'] as String,
      emotion: $enumDecode(_$EmotionsEnumMap, json['emotion']),
      intensity: json['intensity'] as int,
    );

Map<String, dynamic> _$ThoughtToJson(Thought instance) => <String, dynamic>{
      'id': _$JsonConverterToJson<String, ULID>(
          instance.id, const StringULIDConverter().toJson),
      'thought': instance.thought,
      'emotion': _$EmotionsEnumMap[instance.emotion]!,
      'intensity': instance.intensity,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$EmotionsEnumMap = {
  Emotions.disappointed: 'DISAPPOINTED',
  Emotions.delighted: 'DELIGHTED',
  Emotions.happy: 'HAPPY',
  Emotions.irritated: 'IRRITATED',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
