//权限管理类

import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tinydrop/utils/toast_util.dart';

abstract class PermissionImpl {
  Future requestPermission(BuildContext context);
}

class PermissionManage {
  /* factory PermissionManage() => _getInstance();

  static PermissionManage _instance = PermissionManage._();

  static PermissionManage _getInstance() {
    return _instance;
  }
  // 私有构造函数
  PermissionManage._() {
    // 具体初始化代码
  }*/
  static List<PermissionGroup> initPermissions = [
    PermissionGroup.storage,
    PermissionGroup.camera
  ];

  static Future<PermissionStatus> checkPermission(
      PermissionGroup permission) async {
    return await PermissionHandler().checkPermissionStatus(permission);
  }

  static void init() {
    requestPermission(initPermissions);
  }

  static Future<bool> requestPermission(
      List<PermissionGroup> permissionsList) async {
    bool isRequest = true;
    //申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions(permissionsList);
    //申请结果
    permissions.forEach(
        (PermissionGroup permission, PermissionStatus permissionStatus) async {
      // PermissionStatus permissionStatus = await checkPermission(permission);
      if (permissionStatus == PermissionStatus.granted) {
        //申请成功
      } else {
        //申请失败
        ToastUtil.show("$gerPermissionName(permission)权限失败");
        isRequest = false;
        //openSetting();
      }
    });
    return isRequest;
  }

  //跳转设置
  static Future openSetting() async {
    bool isOpened = await PermissionHandler().openAppSettings();
    if (isOpened) {
      //  ToastUtil.show("打开了设置页！", position: ToastPosition.center);
    } else {
      //ToastUtil.show("没打开！", position: ToastPosition.center);
    }
  }

  static String gerPermissionName(PermissionGroup permission) {
    switch (permission) {
      case PermissionGroup.storage:
        return "读写内存";
      default:
        return "";
    }
  }
}
