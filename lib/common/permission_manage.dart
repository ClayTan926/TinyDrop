//权限管理类
class PermissionManage {
  factory PermissionManage() => _getInstance();

  static PermissionManage _instance = PermissionManage._();
  static PermissionManage _getInstance() {
    return _instance;
  }

  // 私有构造函数
  PermissionManage._() {
    // 具体初始化代码
  }
}
