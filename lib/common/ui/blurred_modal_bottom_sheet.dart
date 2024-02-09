import 'dart:ui';

import 'package:backfeed/common/utils/change_statusbar_color.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BackdropBlurredModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool shouldExpandDownwards;
  final double? fractionalOffsetFromTop;

  const BackdropBlurredModal(
      {Key? key,
      required this.child,
      this.backgroundColor,
      required this.shouldExpandDownwards,
      required this.fractionalOffsetFromTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Column(
            mainAxisAlignment: shouldExpandDownwards
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              SizedBox(
                height: (fractionalOffsetFromTop ?? 0) * height,
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
  assert(shouldExpandDownwards && fractionalOffsetFromTop != null,
      "You have provided shouldExpandDownwards = true and did not specify fractionalOffsetFromTop");
  changeStatusBarColor(barrierColor ?? const Color(0x9EEAEAEA));
  final result = await showCustomModalBottomSheet(
      barrierColor: barrierColor,
      context: context,
      builder: builder,
      useRootNavigator: true,
      containerWidget: (_, animation, child) => BackdropBlurredModal(
            fractionalOffsetFromTop: fractionalOffsetFromTop,
            shouldExpandDownwards: shouldExpandDownwards,
            child: child,
          ),
      expand: false);

  return result;
}
