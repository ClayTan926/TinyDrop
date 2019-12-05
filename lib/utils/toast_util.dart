import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';

class ToastUtil {
  static const _defaultDuration = Duration(
    milliseconds: 2300,
  );

  static void show(
    String msg, {
    BuildContext context,
    Duration duration = _defaultDuration,
    ToastPosition position,
    TextStyle textStyle,
    EdgeInsetsGeometry textPadding,
    Color backgroundColor,
    double radius,
    VoidCallback onDismiss,
    TextDirection textDirection,
    bool dismissOtherToast,
    TextAlign textAlign,
  }) {
    showToast(msg);
  }
}
