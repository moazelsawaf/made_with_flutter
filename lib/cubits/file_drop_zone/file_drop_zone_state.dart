part of 'file_drop_zone_cubit.dart';

abstract class FileDropZoneState {}

class FileDropZoneInitial extends FileDropZoneState {}

class FileDropZoneHovered extends FileDropZoneState {}

class FileDropZoneError extends FileDropZoneState {}

class FileDropZoneSelected extends FileDropZoneState {
  final String fileName;
  final int fileSize;
  final Stream<List<int>> fileDataStream;

  FileDropZoneSelected({
    required this.fileName,
    required this.fileSize,
    required this.fileDataStream,
  });
}
