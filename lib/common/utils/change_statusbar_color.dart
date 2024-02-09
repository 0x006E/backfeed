import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

Future<void> changeStatusBarColor(Color color) async {
  Color? statusbarColor = await FlutterStatusbarcolor.getStatusBarColor();
  Color? navigationbarColor =
      await FlutterStatusbarcolor.getNavigationBarColor();
  if (statusbarColor == color && navigationbarColor == color) return;
  await FlutterStatusbarcolor.setStatusBarColor(color);
  await FlutterStatusbarcolor.setNavigationBarColor(color);
  if (useWhiteForeground(color)) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  } else {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
  }
}
