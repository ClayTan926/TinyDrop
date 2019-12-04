import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:tinydrop/config/global_config.dart';
import 'package:tinydrop/utils/platform_utils.dart';

class LogUtils {
  static String _defTag = "TAG";

  static void e(Object msg, [String tag]) {
    _printDebugLog(tag, '  e  ', msg);
  }

  static void v(Object msg, [String tag]) {
    if (GlobalConfig.isDebug) {
      _printLog(tag, '  v  ', msg);
    }
  }

  static void _printLog(String tag, String stag, Object object) async {
    StringBuffer sb = new StringBuffer();
    _defTag = await PlatformUtils.getAppPackageName();
    sb.write((tag == null || tag.isEmpty) ? _defTag : tag);
    sb.write(stag);
    sb.write(object);
    print(sb.toString());
  }

  static void _printDebugLog(String tag, String stag, Object msg) async {
    StringBuffer sb = new StringBuffer();
    _defTag = await PlatformUtils.getAppPackageName();
    sb.write((tag == null || tag.isEmpty) ? _defTag : tag);
    sb.write(stag);
    sb.write(msg);
    debugPrint(sb.toString());
  }
}
