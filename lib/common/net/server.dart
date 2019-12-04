import 'package:tinydrop/config/global_config.dart';
import 'package:tinydrop/utils/platform_utils.dart';

class Server {
  static const String DEV_SERVER_URL = "www.";
  static const String RELEASE_SERVER_URL = "www.";
  static String getServerAddress() {
    if (inProduction) {
      return RELEASE_SERVER_URL;
    } else {
      return DEV_SERVER_URL;
    }
  }
}
