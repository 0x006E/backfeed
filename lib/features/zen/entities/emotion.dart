import 'dart:ui';

import 'package:backfeed/common/data/entities/thought/thought.dart';

class Emotion {
  final Emotions emotion;
  final String label;
  int? intensity;
  final Color color;

  Emotion({
    required this.emotion,
    required this.label,
    required this.intensity,
    required this.color,
  });
}
