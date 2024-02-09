import 'package:animated_visibility/animated_visibility.dart';
import 'package:backfeed/common/ui/blurred_modal_bottom_sheet.dart'
    deferred as modal_bottom_sheet;
import 'package:backfeed/common/utils/change_statusbar_color.dart';
import 'package:backfeed/features/zen/widgets/bottom_sheet.dart'
    deferred as emotion_bottom_sheet;
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class ZenModePage extends StatefulWidget {
  const ZenModePage({super.key});

  @override
  State<ZenModePage> createState() => _ZenModePageState();
}

class _ZenModePageState extends State<ZenModePage> {
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

  String _textContent = "";

  @override
  void initState() {
    changeStatusBarColor(const Color(0xFFFCFCFE));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFCFCFE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Thoughts are saved automatically.",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff808080),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) => setState(() {
                _textContent = value;
              }),
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Start typing...",
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 21,
              ),
              maxLines: null,
              minLines: null,
              expands: true,
            ),
          ),
          AnimatedVisibility(
            enter:
                slideInVertically(initialOffsetY: 1, curve: Curves.decelerate),
            exit: slideOutVertically(
                targetOffsetY: 1, curve: Curves.fastEaseInToSlowEaseOut),
            visible: _textContent.split(" ").length >= 3,
            child: SwipeDetector(
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
            ),
          )
        ],
      ),
    );
  }
}
