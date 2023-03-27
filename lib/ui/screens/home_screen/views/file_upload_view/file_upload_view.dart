import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/file_upload_cubit/file_upload_cubit.dart';
import '../../../../../utils/colors_palette.dart';
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
      child: BlocBuilder<FileUploadCubit, FileUploadState>(
        builder: (context, state) {
          _cubit = context.read<FileUploadCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Made with Flutter?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Upload your APK/AAB file to see whether it was made with Flutter or not',
              ),
              const SizedBox(height: 24),
              const FileDropZone(),
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
                hintText: 'Add file URL',
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
                onPressed: () async {
                  // final fileName =
                  //     await _cubit.dropzoneViewController.getFilename(_file);
                  // final fileData =
                  //     await _cubit.dropzoneViewController.getFileData(_file);
                  // final fileLastModified = await _cubit.dropzoneViewController
                  //     .getFileLastModified(_file);
                  // final fileMIME =
                  //     await _cubit.dropzoneViewController.getFileMIME(_file);
                  // final fileSize =
                  //     await _cubit.dropzoneViewController.getFileSize(_file);

                  // log('fileName: $fileName');
                  // log('fileData: $fileData');
                  // log('fileLastModified: $fileLastModified');
                  // log('fileMIME: $fileMIME');
                  // log('fileSize: $fileSize');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
