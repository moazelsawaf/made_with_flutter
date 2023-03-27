import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../../utils/helpers.dart';

part 'file_drop_zone_state.dart';

class FileDropZoneCubit extends Cubit<FileDropZoneState> {
  FileDropZoneCubit() : super(FileDropZoneInitial());

  late DropzoneViewController dropzoneViewController;

  void setDropzoneController(DropzoneViewController controller) {
    dropzoneViewController = controller;
  }

  void setErrorDropZone() => emit(FileDropZoneError());

  void setInitialDropZone() {
    if (state is FileDropZoneError) return;
    emit(FileDropZoneInitial());
  }

  void setHoveredDropZone() {
    if (state is FileDropZoneError) return;
    emit(FileDropZoneHovered());
  }

  void onDropMultipleFiles(List<dynamic>? files) async {
    try {
      // This one to remove the hover effect after dropping the file
      setInitialDropZone();

      if (state is FileDropZoneError || files == null || files.isEmpty) return;

      if (files.length > 1) {
        // TODO: Show an error message here because we only accept one file
        log('More than one file was dropped');
        return;
      }

      _processFile(files.first);
    } catch (e) {
      log('Error: $e');
    }
  }

  void onChooseFileClicked() async {
    try {
      final files = await dropzoneViewController.pickFiles();

      if (files.isEmpty) return;

      _processFile(files.first);
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> _processFile(dynamic htmlFile) async {
    final fileName = await dropzoneViewController.getFilename(htmlFile);

    if (!Helpers.isAPKOrAABFile(fileName)) {
      // TODO: Show an error message here because we only accept APK or AAB files
      log('File is not an APK or AAB file');
      return;
    }

    emit(FileDropZoneSelected(
      fileName: fileName,
      fileSize: await dropzoneViewController.getFileSize(htmlFile),
      fileDataStream: dropzoneViewController.getFileStream(htmlFile),
    ));
  }
}
