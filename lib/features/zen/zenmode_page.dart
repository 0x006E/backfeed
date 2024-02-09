import 'package:animated_visibility/animated_visibility.dart';
import 'package:auto_route/auto_route.dart';
import 'package:backfeed/common/ui/blurred_modal_bottom_sheet.dart'
    deferred as modal_bottom_sheet;
import 'package:backfeed/common/utils/change_statusbar_color.dart';
import 'package:backfeed/features/zen/emotion_selector_sheet.dart'
    deferred as emotion_selector_bottom_sheet;
import 'package:backfeed/locator.dart';
import 'package:backfeed/router/app_router.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swipedetector_nullsafety/swipedetector_nullsafety.dart';

@RoutePage()
class ZenModePage extends StatefulWidget {
  const ZenModePage({super.key});

  @override
  State<ZenModePage> createState() => _ZenModePageState();
}

class _ZenModePageState extends State<ZenModePage> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Ajay has lost focus.");

  int displayedLineCount = 0;
  double fontSize = 24;
  bool disableTextField = false;

  Future<void> _handleSwipeUp(BuildContext context) async {
    await modal_bottom_sheet.loadLibrary();
    await emotion_selector_bottom_sheet.loadLibrary();
    if (!context.mounted) return;
    modal_bottom_sheet.showBlurredModalBottomSheet(
      shouldExpandDownwards: true,
      fractionalOffsetFromTop: 0.52,
      context: context,
      builder: (BuildContext context) {
        return emotion_selector_bottom_sheet.EmotionSelectorSheet(
          onSave: onSave,
        );
      },
    );
  }

  Future<void> onSave() async {
    setState(() {
      disableTextField = true;
    });
    await locator<AppRouter>().navigate(const ThoughtsRoute());
  }

  void updateDisplayedLineCount() {
    final span = _textEditingController.buildTextSpan(
      context: context,
      withComposing: false,
      style: TextStyle(
          fontSize: fontSize,
          height: 1.4,
          letterSpacing: fontSize == 24 ? -0.3 : -0.2),
    );
    final textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: null,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 32);
    setState(() {
      final currentLineCount = textPainter.computeLineMetrics().length;
      final diffInLineCount = (currentLineCount - displayedLineCount).abs();
      if (diffInLineCount > 2) {
        if (fontSize == 24) {
          fontSize = 20;
        } else {
          fontSize = 24;
        }
        displayedLineCount = currentLineCount;
      }
    });
  }

  @override
  void initState() {
    changeStatusBarColor(const Color(0xFFFCFCFE));
    _textEditingController.addListener(updateDisplayedLineCount);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'note1',
      child: Container(
        color: const Color(0xFFFCFCFE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 250),
                firstChild: const Text(
                  "Thoughts are saved automatically.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff808080),
                  ),
                ),
                secondChild: const Text(
                  "Keep typing.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff808080),
                  ),
                ),
                crossFadeState:
                    _textEditingController.text.split(" ").length >= 3
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
              ),
            ),
            Expanded(
              child: TextFormField(
                enabled: !disableTextField,
                autofocus: true,
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: "Start typing...",
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                    fontSize: fontSize,
                    height: 1.4,
                    letterSpacing: fontSize == 24 ? -0.3 : -0.2),
                maxLines: null,
                minLines: null,
                expands: true,
              ),
            ),
            AnimatedVisibility(
              enter: slideInVertically(
                  initialOffsetY: 1, curve: Curves.decelerate),
              exit: slideOutVertically(
                  targetOffsetY: 1, curve: Curves.fastEaseInToSlowEaseOut),
              visible: _textEditingController.text.split(" ").length >= 3,
              child: SwipeDetector(
                onSwipeUp: () => _handleSwipeUp(context),
                child: Container(
                  // color: Color(0xFF545454),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.chevronsUp,
                        size: 16,
                      ),
                      Gap(2),
                      Text(
                        "Swipe to save",
                        style: TextStyle(
                            color: Color(0xFF545454),
                            fontSize: 14,
                            height: 1.64),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
