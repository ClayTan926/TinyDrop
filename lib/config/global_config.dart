import 'package:flutter/material.dart';

/// 是否是生产环境,true为Release，false为Debug和Profile
const bool inProduction = const bool.fromEnvironment("dart.vm.product");

class GlobalConfig {
  static bool dark = false;
  static Color fontColor = Colors.black54;
  static bool isDebug;

  static void init([bool debuggable]) {
    if (isDebug == null) {
      isDebug = !inProduction;
    } else {
      isDebug = debuggable;
    }
  }
}
