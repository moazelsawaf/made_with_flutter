import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:made_with_flutter/cubits/file_drop_zone/file_drop_zone_cubit.dart';
import 'package:made_with_flutter/cubits/file_upload_cubit/file_upload_cubit.dart';
import 'package:made_with_flutter/utils/extensions.dart';
import 'package:made_with_flutter/utils/toasts.dart';

import '../../../../../utils/colors_palette.dart';

class FileDropZone extends StatefulWidget {
  const FileDropZone({super.key});

  @override
  State<FileDropZone> createState() => _FileDropZoneState();
}

class _FileDropZoneState extends State<FileDropZone> {
  late bool _isMobile;

  @override
  Widget build(BuildContext context) {
    _isMobile = MediaQuery.of(context).size.isMobile;
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
          } else if (state is InvalidFileDropped) {
            Toasts.error(
              context: context,
              title: state.errorTitle,
              message: state.errorMessage,
            );
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
                  onHover: _isMobile ? null : () => cubit.setHoveredDropZone(),
                  onLeave: _isMobile ? null : () => cubit.setInitialDropZone(),
                  onError: _isMobile ? null : (_) => cubit.setErrorDropZone(),
                  onDropMultiple:
                      _isMobile ? (_) {} : cubit.onDropMultipleFiles,
                ),
              ),
              GestureDetector(
                onTap: _isMobile ? cubit.onChooseFileClicked : null,
                child: DottedBorder(
                  padding: EdgeInsets.zero,
                  radius: const Radius.circular(6),
                  borderType: BorderType.RRect,
                  dashPattern: state is FileDropZoneHovered ? [6, 0] : [6, 3],
                  color: _getBorderColor(state),
                  strokeWidth: _getBorderWidth(state),
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
                            state is DropZoneInitializationError
                                ? Icons.error_outline_rounded
                                : Icons.file_upload_outlined,
                            color: _getBorderColor(state),
                            size: 30,
                          ),
                          const SizedBox(height: 12),
                          Text.rich(
                            TextSpan(
                              children: [
                                if (_isMobile)
                                  const TextSpan(
                                    text: 'Tap to choose file to upload',
                                  )
                                else if (state
                                    is DropZoneInitializationError) ...[
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
                              style: TextStyle(
                                color: _isMobile
                                    ? ColorsPalette.white
                                    : ColorsPalette.gray900,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state is DropZoneInitializationError
                                ? 'Please try to restart the page'
                                : 'APK or AAB',
                            style: TextStyle(
                              color: _isMobile
                                  ? ColorsPalette.gray200
                                  : ColorsPalette.gray600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
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

  double _getBorderWidth(FileDropZoneState state) {
    if (_isMobile) {
      return 0;
    } else if (state is FileDropZoneInitial) {
      return 1.5;
    } else {
      return 1.5;
    }
  }

  Color _getBackgroundColor(FileDropZoneState state) {
    if (_isMobile) {
      return ColorsPalette.primaryColor;
    } else if (state is FileDropZoneHovered) {
      return ColorsPalette.primaryColor.withOpacity(0.05);
    } else if (state is DropZoneInitializationError) {
      return ColorsPalette.red.withOpacity(0.05);
    } else {
      return Colors.transparent;
    }
  }

  Color _getBorderColor(FileDropZoneState state) {
    if (_isMobile) {
      return ColorsPalette.gray200;
    } else if (state is FileDropZoneHovered) {
      return ColorsPalette.primaryColor;
    } else if (state is DropZoneInitializationError) {
      return Colors.red;
    } else {
      return ColorsPalette.gray500;
    }
  }
}
