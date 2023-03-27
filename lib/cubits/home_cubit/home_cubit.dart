import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:made_with_flutter/utils/helpers.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> analyzeFile({
    required String fileName,
    required List<int> fileBytes,
  }) async {
    emit(HomeLoading());

    await Future.delayed(const Duration(seconds: 3));

    final archive = ZipDecoder().decodeBytes(fileBytes);

    final filesToCheck = [
      // For APK
      'lib/arm64-v8a/libflutter.so',
      'lib/armeabi-v7a/libflutter.so',
      'lib/x86_64/libflutter.so',
      // For AAB
      'base/lib/arm64-v8a/libflutter.so',
      'base/lib/armeabi-v7a/libflutter.so',
      'base/lib/x86_64/libflutter.so',
    ];

    final appIconImagesFiles =
        archive.files.where((file) => Helpers.isAppIconFile(file)).toList();

    final madeWithFlutter = filesToCheck.any((fileToCheck) {
      final file = archive.findFile(fileToCheck);
      return file != null;
    });

    Uint8List? appIconBytes;

    if (appIconImagesFiles.isNotEmpty) {
      // Here I am taking the last file because it has the highest resolution
      // because the files are sorted alphabetically
      appIconBytes = appIconImagesFiles.last.content as Uint8List;
    }

    emit(
      HomeResult(
        madeWithFlutter: madeWithFlutter,
        applicationName: Helpers.getFileNameWithoutExtension(fileName),
        appIconBytes: appIconBytes,
      ),
    );
  }

  void reset() {
    emit(HomeInitial());
  }
}
