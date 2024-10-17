import 'dart:io';

class VerifyConnectivity {
  Future<bool> netPing() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      else
        return false;
    } catch (exception) {
      return false;
    }
  }

  Future<bool> simpleAgriSytemPing(String system) async {
    try {
      final result = await InternetAddress.lookup('$system.simpleagri.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      else
        return false;
    } catch (exception) {
      return false;
    }
  }
}