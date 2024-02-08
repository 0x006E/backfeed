import 'package:animated_visibility/animated_visibility.dart';
import 'package:backfeed/features/zen/entities/emotion.dart';
import 'package:backfeed/features/zen/widgets/emotion_selector.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sprung/sprung.dart';

final List<int> _colors = [0xffFF2525, 0xffFF6B00, 0xffFFB11B, 0xff007AFF];
final List<String> _emotionLabels = [
  "Disappointed",
  "Delighted",
  "Happy",
  "Irritated"
];

class EmotionBottomSheet extends StatefulWidget {
  const EmotionBottomSheet({super.key});

  @override
  State<EmotionBottomSheet> createState() => _EmotionBottomSheetState();
}

class _EmotionBottomSheetState extends State<EmotionBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final List<Emotion> _emotions = List.generate(_emotionLabels.length, (i) {
    return Emotion(
        label: _emotionLabels[i], intensity: null, color: Color(_colors[i]));
  });
  final List<bool?> _selected =
      List.generate(_emotionLabels.length, (i) => null);

  @override
  initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    super.initState();
    print(_emotions);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
                height: 1.64),
          ),
          ListView.builder(
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
            enter:
                slideInVertically(initialOffsetY: 1, curve: Sprung.underDamped),
            exit: slideOutVertically(
                targetOffsetY: 1, curve: Curves.fastEaseInToSlowEaseOut),
            visible: _selected.contains(true),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: const Color(0xff232429),
              ),
              onPressed: () {},
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
