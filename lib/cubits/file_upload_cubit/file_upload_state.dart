part of 'file_upload_cubit.dart';

abstract class FileUploadState {
  final String fileName;
  final int fileSize;

  FileUploadState({
    required this.fileName,
    required this.fileSize,
  });
}

class FileUploadInitial extends FileUploadState {
  FileUploadInitial() : super(fileName: '', fileSize: 0);
}

class FileUploading extends FileUploadState {
  final int uploadedFileSize;

  FileUploading({
    required String fileName,
    required int fileSize,
    required this.uploadedFileSize,
  }) : super(
          fileName: fileName,
          fileSize: fileSize,
        );
}

class FileUploaded extends FileUploadState {
  final List<int> fileBytes;

  FileUploaded({
    required String fileName,
    required int fileSize,
    required this.fileBytes,
  }) : super(
          fileName: fileName,
          fileSize: fileSize,
        );
}

class FileUploadError extends FileUploadState {
  final String errorTitle;
  final String errorMessage;

  FileUploadError({
    required String fileName,
    required int fileSize,
    required this.errorTitle,
    required this.errorMessage,
  }) : super(
          fileName: fileName,
          fileSize: fileSize,
        );
}

class FileRemoved extends FileUploadState {
  FileRemoved() : super(fileName: '', fileSize: 0);
}
