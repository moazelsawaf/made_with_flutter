import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'toasts.dart';

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

  static bool isAppIconFile(ArchiveFile file) {
    return file.name.contains('res/mipmap') && file.name.endsWith('.png');
  }

  static String getFileNameWithoutExtension(String fileName) {
    final extensionStartIndex = fileName.lastIndexOf('.');
    return fileName.substring(0, extensionStartIndex);
  }

  static void openUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (_) {}
  }

  static void showComingSoonToast(BuildContext context) {
    Toasts.info(
      context: context,
      title: 'Coming Soon ...',
      message: 'Coming Soon, stay tuned!',
    );
  }
}
