import 'dart:io';



import 'log.dart';
class FileUtil {
  static String? defaultDir;


  static bool isExist(String filePath) {
    return File.fromUri(Uri.file(filePath)).existsSync();
  }



  static String? lookupMimeType(String filePath) {
    return lookupMimeType(filePath);
  }

  static bool isFolder(String filePath) {
    return FileSystemEntity.isDirectorySync(filePath);
  }



  static bool deleteFile({
    required String filePath,
    bool recursive = false,
  }) {
    try {
      File(filePath).deleteSync(recursive: recursive);

      return true;
    } catch (e) {
      Log.e('Error deleting file: $e');
    }

    return false;
  }
}
