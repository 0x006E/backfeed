import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmotionSelector extends StatelessWidget {
  const EmotionSelector(
      {super.key,
      required this.selected,
      required this.intensity,
      required this.label,
      required this.color,
      this.onTap});
  final bool? selected;
  final int? intensity;
  final Color color;
  final String label;
  final Function()? onTap;

  final Duration _duration = const Duration(milliseconds: 400);

  Widget getDots({int? intensity}) {
    double scaleFactor = 0.8;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: List.generate(
        3,
        (index) {
          scaleFactor += 0.2;
          return AnimatedScale(
            duration: _duration,
            scale:
                (selected == null || !selected!) && index > 1 ? 0 : scaleFactor,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index <= ((intensity ?? 0) + 1)
                    ? color
                    : const Color(0xffD9D9D9),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isInitial = selected == null;
    final opacity = isInitial || selected == true ? 1.0 : 0.2;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        duration: _duration,
        opacity: opacity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              getDots(intensity: intensity),
              const Gap(8),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xff3D3D3D),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
