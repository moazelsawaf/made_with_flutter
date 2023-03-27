import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:made_with_flutter/cubits/file_drop_zone/file_drop_zone_cubit.dart';
import 'package:made_with_flutter/cubits/file_upload_cubit/file_upload_cubit.dart';

import '../../../../../utils/colors_palette.dart';

class FileDropZone extends StatefulWidget {
  const FileDropZone({super.key});

  @override
  State<FileDropZone> createState() => _FileDropZoneState();
}

class _FileDropZoneState extends State<FileDropZone> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileDropZoneCubit(),
      child: BlocConsumer<FileDropZoneCubit, FileDropZoneState>(
        listener: (context, state) {
          if (state is FileDropZoneSelected) {
            context.read<FileUploadCubit>().onFileSelected(
                  fileName: state.fileName,
                  fileSize: state.fileSize,
                  fileDataStream: state.fileDataStream,
                );
          } else if (state is FileUploadError) {
            // TODO: Show error message
          }
        },
        builder: (context, state) {
          final cubit = context.read<FileDropZoneCubit>();
          return Stack(
            children: [
              Positioned.fill(
                child: DropzoneView(
                  operation: DragOperation.copy,
                  onCreated: (controller) =>
                      cubit.setDropzoneController(controller),
                  onHover: () => cubit.setHoveredDropZone(),
                  onLeave: () => cubit.setInitialDropZone(),
                  onError: (_) => cubit.setErrorDropZone(),
                  onDropMultiple: cubit.onDropMultipleFiles,
                ),
              ),
              DottedBorder(
                padding: EdgeInsets.zero,
                radius: const Radius.circular(6),
                borderType: BorderType.RRect,
                dashPattern: state is FileDropZoneHovered ? [6, 0] : [6, 3],
                color: _getBorderColor(state),
                strokeWidth: state is FileDropZoneInitial ? 1 : 1.5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: _getBackgroundColor(state),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: [
                        Icon(
                          state is FileDropZoneError
                              ? Icons.error_outline_rounded
                              : Icons.file_upload_outlined,
                          color: _getBorderColor(state),
                          size: 30,
                        ),
                        const SizedBox(height: 12),
                        Text.rich(
                          TextSpan(
                            children: [
                              if (state is FileDropZoneError) ...[
                                const TextSpan(
                                  text: 'An error occurred',
                                  style: TextStyle(
                                    color: ColorsPalette.red,
                                  ),
                                ),
                              ] else ...[
                                const TextSpan(text: 'Drag & Drop or'),
                                TextSpan(
                                  text: ' Choose File ',
                                  style: const TextStyle(
                                    color: ColorsPalette.primaryColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = cubit.onChooseFileClicked,
                                ),
                                const TextSpan(text: 'to upload'),
                              ],
                            ],
                            style: const TextStyle(
                              color: ColorsPalette.gray900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          state is FileDropZoneError
                              ? 'Please try to restart the page'
                              : 'APK or AAB',
                          style: const TextStyle(
                            color: ColorsPalette.gray600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Color _getBackgroundColor(FileDropZoneState state) {
    if (state is FileDropZoneHovered) {
      return ColorsPalette.primaryColor.withOpacity(0.05);
    } else if (state is FileDropZoneError) {
      return ColorsPalette.red.withOpacity(0.05);
    } else {
      return Colors.transparent;
    }
  }

  Color _getBorderColor(FileDropZoneState state) {
    if (state is FileDropZoneHovered) {
      return ColorsPalette.primaryColor;
    } else if (state is FileDropZoneError) {
      return Colors.red;
    } else {
      return ColorsPalette.gray500;
    }
  }
}
