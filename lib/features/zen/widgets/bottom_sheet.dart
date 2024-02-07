import 'package:backfeed/features/zen/entities/emotion.dart';
import 'package:backfeed/features/zen/widgets/emotion_selector.dart';
import 'package:flutter/material.dart';

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
                  onTap: () {
                    setState(() {
                      for (var i = 0; i < _selected.length; i++) {
                        _selected[i] = false;
                      }
                      _selected[i] = true;
                      for (var element in _emotions) {
                        element.intensity = null;
                      }
                      _emotions[i].intensity =
                          ((_emotions[i].intensity ?? 0) + 1) % 3 + 1;
                    });
                  },
                  selected: _selected[i],
                  intensity: _emotions[i].intensity,
                  label: _emotions[i].label,
                  color: _emotions[i].color,
                );
              }),
        ],
      ),
    );
  }
}
