class Helpers {
  Helpers._();

  static bool isAPKOrAABFile(String fileName) {
    final loweredFileName = fileName.toLowerCase();
    return loweredFileName.endsWith('.apk') || loweredFileName.endsWith('.aab');
  }

  static String formatFileSize(int fileSizeInBytes) {
    if (fileSizeInBytes < 1024) {
      return '$fileSizeInBytes B';
    } else if (fileSizeInBytes < 1048576) {
      return '${(fileSizeInBytes / 1024).toStringAsFixed(2)} KB';
    } else if (fileSizeInBytes < 1073741824) {
      return '${(fileSizeInBytes / 1048576).toStringAsFixed(2)} MB';
    } else {
      return '${(fileSizeInBytes / 1073741824).toStringAsFixed(2)} GB';
    }
  }
}
