import 'dart:io';
import 'dart:async';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

export 'dart:io';

class PlatformUtils {
  //app包信息
  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  //appName
  static Future<String> getAppPackageName() async {
    return (await getAppPackageInfo()).packageName;
  }

  //app版本名
  static Future<String> getAppVersion() async {
    return (await getAppPackageInfo()).version;
  }

  //app版本号
  static Future<String> getBuildNum() async {
    return (await getAppPackageInfo()).buildNumber;
  }

  //获取设备信息
  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }

  static Future<String> getDeviceName() async {
    String deviceName = "unKonwn";
    if (Platform.isAndroid) {
      deviceName = "Android";
    }
    if (Platform.isIOS) {
      deviceName = "IOS";
    }
    return deviceName;
  }
}
