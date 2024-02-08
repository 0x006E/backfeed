import 'package:backfeed/common/ui/blurred_modal_bottom_sheet.dart'
    deferred as modal_bottom_sheet;
import 'package:backfeed/features/zen/widgets/bottom_sheet.dart'
    deferred as emotion_bottom_sheet;
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class ZenModePage extends StatelessWidget {
  const ZenModePage({super.key});

  Future<void> _handleSwipeUp(Offset? offset, BuildContext context) async {
    if (offset == null) return;
    await modal_bottom_sheet.loadLibrary();
    await emotion_bottom_sheet.loadLibrary();
    if (!context.mounted) return;
    modal_bottom_sheet.showBlurredModalBottomSheet(
      shouldExpandDownwards: true,
      fractionalOffsetFromTop: 0.5,
      context: context,
      builder: (BuildContext context) {
        return emotion_bottom_sheet.EmotionBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        const Expanded(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Start typing...",
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 21,
            ),
            maxLines: null,
            minLines: null,
            expands: true,
          ),
        ),
        SwipeDetector(
          behavior: HitTestBehavior.translucent,
          onSwipeUp: (Offset? offset) => _handleSwipeUp(offset, context),
          child: Container(
            // color: Color(0xFF545454),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Swipe to save",
                  style: TextStyle(
                      color: Color(0xFF545454), fontSize: 14, height: 1.64),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
