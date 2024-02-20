import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

part 'thought.g.dart';

/*
{
  "id": "01AN4Z07BY79KA1307SR9X4MV3",
	"thought": "Hello\n",
	"emotion": "DISAPPOINTED",
	"intensity": 1
}*/

@JsonEnum(valueField: 'emotion')
enum Emotions {
  @JsonValue("DISAPPOINTED")
  disappointed,
  @JsonValue("DELIGHTED")
  delighted,
  @JsonValue("HAPPY")
  happy,
  @JsonValue("IRRITATED")
  irritated
}

@JsonSerializable()
class Thought extends Equatable {
  const Thought({
    this.id,
    required this.thought,
    required this.emotion,
    required this.intensity,
  });

  @StringULIDConverter()
  final ULID? id;
  static const String idKey = "id";

  final String thought;
  static const String thoughtKey = "thought";

  final Emotions emotion;
  static const String emotionKey = "emotion";

  final int intensity;
  static const String intensityKey = "intensity";

  Thought copyWith({
    ULID? id,
    String? thought,
    Emotions? emotion,
    int? intensity,
  }) {
    return Thought(
      id: id ?? this.id,
      thought: thought ?? this.thought,
      emotion: emotion ?? this.emotion,
      intensity: intensity ?? this.intensity,
    );
  }

  factory Thought.fromJson(Map<String, dynamic> json) =>
      _$ThoughtFromJson(json);

  Map<String, dynamic> toJson() => _$ThoughtToJson(this);

  @override
  List<Object?> get props => [
        thought,
        emotion,
        intensity,
      ];
}

class StringULIDConverter implements JsonConverter<ULID, String> {
  const StringULIDConverter();

  @override
  ULID fromJson(String json) => ULID.fromString(json);

  @override
  String toJson(ULID object) => object.toString();
}
