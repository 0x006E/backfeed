import 'package:animated_visibility/animated_visibility.dart';
import 'package:auto_route/auto_route.dart';
import 'package:backfeed/common/data/entities/thought/thought.dart';
import 'package:backfeed/features/zen/entities/emotion.dart';
import 'package:backfeed/features/zen/widgets/emotion_selector.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sprung/sprung.dart';

final _emotionColorMap = {
  Emotions.disappointed: (
    label: "Disappointed",
    color: const Color(0xffFF2525)
  ),
  Emotions.delighted: (label: "Delighted", color: const Color(0xffFF6B00)),
  Emotions.happy: (label: "Happy", color: const Color(0xffFFB11B)),
  Emotions.irritated: (label: "Irritated", color: const Color(0xff007AFF))
};

class EmotionSelectorSheet extends StatefulWidget {
  const EmotionSelectorSheet({super.key, required this.onSave});

  final Function(Emotion) onSave;

  @override
  State<EmotionSelectorSheet> createState() => _EmotionSelectorSheetState();
}

class _EmotionSelectorSheetState extends State<EmotionSelectorSheet> {
  final List<Emotion> _emotions = _emotionColorMap.entries
      .map((entry) => Emotion(
          emotion: entry.key,
          label: entry.value.label,
          intensity: null,
          color: entry.value.color))
      .toList();
  final List<bool?> _selected =
      List.generate(_emotionColorMap.length, (i) => null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Add mood",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 21, height: 1.1),
          ),
          const Text(
            "Set mood and intensity",
            style: TextStyle(
              color: Color(0xff646464),
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.64,
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (BuildContext context, i) {
              return EmotionSelector(
                onPressed: () {
                  setState(() {
                    final int? currentIntensity = _emotions[i].intensity;
                    for (var i = 0; i < _selected.length; i++) {
                      _selected[i] = false;
                      _emotions[i].intensity = null;
                    }
                    _selected[i] = true;
                    if (currentIntensity == null) {
                      _emotions[i].intensity = 1;
                    } else {
                      _emotions[i].intensity = (currentIntensity % 3) + 1;
                    }
                  });
                },
                selected: _selected[i],
                intensity: _emotions[i].intensity,
                label: _emotions[i].label,
                color: _emotions[i].color,
              );
            },
          ),
          const Gap(4),
          AnimatedVisibility(
            enter: slideInVertically(
                initialOffsetY: 1, curve: Sprung.criticallyDamped),
            exit: slideOutVertically(
                targetOffsetY: 1, curve: Curves.fastEaseInToSlowEaseOut),
            visible: _selected.contains(true),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: const Color(0xff232429),
              ),
              onPressed: () {
                context.router.pop();
                final selectedEmotion = _selected.indexOf(true);
                widget.onSave(_emotions[selectedEmotion]);
              },
              child: const Text(
                "Save",
                style:
                    TextStyle(fontSize: 16, height: 1.43, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
