import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'file_upload_state.dart';

class FileUploadCubit extends Cubit<FileUploadState> {
  FileUploadCubit() : super(FileUploadInitial());

  StreamSubscription<List<int>>? _fileUploadSubscription;

  void onFileSelected({
    required String fileName,
    required int fileSize,
    required Stream<List<int>> fileDataStream,
  }) {
    _stopCurrentFileUploading();
    List<int> fileBytes = [];

    _fileUploadSubscription = fileDataStream.listen(
      cancelOnError: true,
      (bytes) {
        fileBytes.addAll(bytes);

        emit(
          FileUploading(
            fileName: fileName,
            fileSize: fileSize,
            uploadedFileSize: fileBytes.length,
          ),
        );
      },
      onDone: () {
        emit(
          FileUploaded(
            fileName: fileName,
            fileSize: fileSize,
            fileBytes: fileBytes,
          ),
        );
      },
      onError: (error) {
        log('Error: $error');

        emit(
          FileUploadError(
            fileName: fileName,
            fileSize: fileSize,
          ),
        );
      },
    );
  }

  void removeFile() {
    _stopCurrentFileUploading();

    emit(FileRemoved());
  }

  void _stopCurrentFileUploading() {
    _fileUploadSubscription?.cancel();
    _fileUploadSubscription = null;
  }
}
