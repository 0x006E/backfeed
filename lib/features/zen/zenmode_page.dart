import 'dart:ui';

import 'package:backfeed/features/zen/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

class ZenModePage extends StatelessWidget {
  const ZenModePage({super.key});

  void _handleTap(BuildContext context) {
    showModalBottomSheet(
        clipBehavior: Clip.antiAlias,
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: Container(
                color: const Color(0xFFEAEAEA).withOpacity(0.62),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            margin: const EdgeInsets.all(16),
                            child: const EmotionBottomSheet(),
                          ),
                        ),
                        const Flexible(
                          child: FractionallySizedBox(
                            heightFactor: 0.25,
                          ),
                        )
                      ]),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        const Expanded(
          child: TextField(
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
        GestureDetector(
          onTap: () => _handleTap(context),
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
