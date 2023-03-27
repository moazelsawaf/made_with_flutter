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

  void setErrorDropZone() => emit(DropZoneInitializationError());

  void setInitialDropZone() {
    if (state is DropZoneInitializationError) return;
    emit(FileDropZoneInitial());
  }

  void setHoveredDropZone() {
    if (state is DropZoneInitializationError) return;
    emit(FileDropZoneHovered());
  }

  void onDropMultipleFiles(List<dynamic>? files) async {
    try {
      // This one to remove the hover effect after dropping the file
      setInitialDropZone();

      if (state is DropZoneInitializationError ||
          files == null ||
          files.isEmpty) return;

      if (files.length > 1) {
        emit(
          InvalidFileDropped(
            errorTitle: 'Multiple Files Dropped',
            errorMessage: 'Only one file is allowed at a time',
          ),
        );
        return;
      }

      _processFile(files.first);
    } catch (e) {
      log('Error: $e');

      emit(
        InvalidFileDropped(
          errorTitle: 'An Error Occurred',
          errorMessage: 'An error occurred, please try again',
        ),
      );
    }
  }

  void onChooseFileClicked() async {
    try {
      final files = await dropzoneViewController.pickFiles();

      if (files.isEmpty) return;

      _processFile(files.first);
    } catch (e) {
      log('Error: $e');

      emit(
        InvalidFileDropped(
          errorTitle: 'An Error Occurred',
          errorMessage: 'An error occurred, please try again',
        ),
      );
    }
  }

  Future<void> _processFile(dynamic htmlFile) async {
    final fileName = await dropzoneViewController.getFilename(htmlFile);

    if (!Helpers.isAPKOrAABFile(fileName)) {
      emit(
        InvalidFileDropped(
          errorTitle: 'Invalid File Type',
          errorMessage: 'Only APK or AAB files are allowed',
        ),
      );
      return;
    }

    emit(FileDropZoneSelected(
      fileName: fileName,
      fileSize: await dropzoneViewController.getFileSize(htmlFile),
      fileDataStream: dropzoneViewController.getFileStream(htmlFile),
    ));
  }
}
