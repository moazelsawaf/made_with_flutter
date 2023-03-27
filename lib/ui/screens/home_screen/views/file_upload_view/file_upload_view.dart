import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:made_with_flutter/cubits/home_cubit/home_cubit.dart';

import '../../../../../cubits/file_upload_cubit/file_upload_cubit.dart';
import '../../../../../utils/colors_palette.dart';
import '../../../../../utils/toasts.dart';
import '../../../../widgets/form/primary_button.dart';
import '../../../../widgets/form/text_input.dart';
import 'file_drop_zone.dart';
import 'uploaded_file_card.dart';

class FileUploadView extends StatefulWidget {
  const FileUploadView({super.key});

  @override
  State<FileUploadView> createState() => _FileUploadViewState();
}

class _FileUploadViewState extends State<FileUploadView> {
  late FileUploadCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileUploadCubit(),
      child: BlocConsumer<FileUploadCubit, FileUploadState>(
        listener: (context, state) {
          if (state is FileUploadError) {
            Toasts.error(
              context: context,
              title: state.errorTitle,
              message: state.errorMessage,
            );
          }
        },
        builder: (context, state) {
          _cubit = context.read<FileUploadCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Made with Flutter?',
                style: TextStyle(
                  color: ColorsPalette.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Upload your APK/AAB file to see whether it was made with Flutter or not',
              ),
              const SizedBox(height: 24),
              const FileDropZone(),
              const SizedBox(height: 24),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Note: ',
                      style: TextStyle(
                        color: ColorsPalette.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'The files are not uploaded to any server, they are processed locally on your machine.',
                    ),
                  ],
                  style: TextStyle(
                    color: ColorsPalette.gray900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (state is! FileUploadInitial && state is! FileRemoved) ...[
                UploadedFileCard(
                  fileName: state.fileName,
                  fileSize: state.fileSize,
                  uploadedFileSize:
                      state is FileUploading ? state.uploadedFileSize : null,
                  hasError: state is FileUploadError,
                  onRemove: () => _cubit.removeFile(),
                ),
                const SizedBox(height: 24),
              ],
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: ColorsPalette.gray300,
                      endIndent: 24,
                      thickness: 1.5,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: ColorsPalette.gray600,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: ColorsPalette.gray300,
                      indent: 24,
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Import from a URL',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              TextInput(
                enabled: false,
                // hintText: 'Add file URL',
                hintText: 'Coming Soon ...',
                controller: TextEditingController(),
                suffixIcon: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text('Upload'),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Made with Flutter?',
                onPressed: state is FileUploaded
                    ? () => _analyzeFile(
                          fileName: state.fileName,
                          fileBytes: state.fileBytes,
                        )
                    : null,
              ),
            ],
          );
        },
      ),
    );
  }

  void _analyzeFile({
    required String fileName,
    required List<int> fileBytes,
  }) {
    context.read<HomeCubit>().analyzeFile(
          fileName: fileName,
          fileBytes: fileBytes,
        );
  }
}
