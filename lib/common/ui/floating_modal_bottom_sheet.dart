import 'package:backfeed/common/utils/change_statusbar_color.dart';
import "package:boxy/boxy.dart";
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FloatingModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double expandHeight;

  const FloatingModal({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.expandHeight = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomBoxy(
                delegate: HeightBoxy(expandHeight: expandHeight),
                children: [
                  BoxyId(
                    id: #bottomsheet,
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.transparent,
                      child: child,
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

class HeightBoxy extends BoxyDelegate {
  HeightBoxy({required this.expandHeight}) : super();

  final double expandHeight;
  static double height = 0.0;
  @override
  Size layout() {
    final bottomsheet = getChild<BoxyChild>(#bottomsheet);
    final bottomSheetSize = bottomsheet.layout(constraints);
    // TODO: Find some kind of logic to find the size of the child that needs to be expanded
    double newExpandHeight = expandHeight;
    if (height != bottomSheetSize.height && height != 0.0) {
      newExpandHeight = 0.0;
    }
    if (height == 0.0) {
      height = bottomSheetSize.height;
    }
    return bottomSheetSize + Offset(0, newExpandHeight);
  }
}

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,

  /// Color of the modal backdrop
  Color? barrierColor = const Color(0x9EEAEAEA),

  /// The height of the widget that needs to be expanded down
  double expandHeight = 0.0,
}) async {
  changeStatusBarColor(barrierColor ?? const Color(0x9EEAEAEA));
  final result = await showCustomModalBottomSheet(
    barrierColor: barrierColor,
    context: context,
    builder: builder,
    useRootNavigator: true,
    containerWidget: (_, animation, child) => FloatingModal(
      expandHeight: expandHeight,
      child: child,
    ),
  );

  return result;
}
