import 'package:elegant_spring_animation/elegant_spring_animation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmotionSelector extends StatelessWidget {
  const EmotionSelector(
      {super.key,
      required this.selected,
      required this.intensity,
      required this.label,
      required this.color,
      this.onPressed});
  final bool? selected;
  final int? intensity;
  final Color color;
  final String label;
  final Function()? onPressed;

  final Duration _duration = const Duration(milliseconds: 300);

  Widget getDots({int? intensity}) {
    double scaleFactor = 0.8;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: intensity == null ? 0 : 8,
      children: List.generate(
        3,
        (index) {
          scaleFactor += 0.2;
          return AnimatedSize(
            duration: _duration,
            curve: ElegantSpring(duration: _duration, bounce: 0.5),
            child: SizedBox(
              width: ((selected == null || !selected!) && index > 0
                  ? 0
                  : 15 * scaleFactor),
              height: ((selected == null || !selected!) && index > 0
                  ? 0
                  : 15 * scaleFactor),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index <= (intensity ?? 1) - 1
                      ? color
                      : const Color(0xffD9D9D9),
                ),
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
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
      ),
      onPressed: onPressed,
      child: AnimatedOpacity(
        duration: _duration,
        curve: Curves.decelerate,
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
