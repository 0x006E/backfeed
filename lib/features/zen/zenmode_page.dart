import 'package:backfeed/features/zen/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

class ZenModePage extends StatelessWidget {
  const ZenModePage({super.key});

  void _handleTap(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const EmotionBottomSheet();
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
