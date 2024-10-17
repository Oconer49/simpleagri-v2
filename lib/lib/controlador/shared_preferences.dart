import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String prefs_database = '';
  static const String prefs_version_db = '';
  static const String prefs_system = '';
  static const String prefs_http_host = 'dev.simpleagri.com';
  static const String prefs_http_index = 'index.php';
  static const String prefs_http_start = 'start.php';
  static String prefs_authentication = '';
  static const String prefs_dateDownload = '';

  static const String prefs_segurityUser = 'nada';
  static const int prefs_opciones = 1;

  Future setSystem(String system) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefs_system, system);
  }

  Future<String?> getSystem() async {
    final prefs = await SharedPreferences.getInstance();
    String? valueSystem = prefs.getString(prefs_system);
    return valueSystem;
  }

  Future<String?> getDatabase() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(prefs_database);
  }

  Future<String?> getVersionDatabase() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(prefs_version_db);
  }

  Future<String> setDateDownload(String dateRegister) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefs_dateDownload, dateRegister);
    return "";
  }

  Future<String?> getDateDownload() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(prefs_dateDownload);
  }
}