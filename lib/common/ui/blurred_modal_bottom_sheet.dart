import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BackdropBlurredModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const BackdropBlurredModal(
      {Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            children: [
              SizedBox(
                height: 0.5 * height,
              ),
              Material(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(24),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<T> showBlurredModalBottomSheet<T>(
    {required BuildContext context,
    required WidgetBuilder builder,

    /// Color of the modal backdrop
    Color? barrierColor = const Color(0x9EEAEAEA),

    /// Values needed for the backdrop gausian blur
    double sigmaX = 5,
    double sigmaY = 5,
    bool shouldExpandDownwards = false,

    /// If the modal should expand downwards, then the modal's position from top must be given manually
    /// and it should be a fraction
    double? fractionalOffsetFromTop}) async {
  assert(shouldExpandDownwards && fractionalOffsetFromTop != null);
  final result = await showCustomModalBottomSheet(
      barrierColor: barrierColor,
      context: context,
      builder: builder,
      containerWidget: (_, animation, child) => BackdropBlurredModal(
            child: child,
          ),
      expand: false);

  return result;
}
