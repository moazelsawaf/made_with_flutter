import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';
import 'package:made_with_flutter/utils/helpers.dart';

class UploadedFileCard extends StatelessWidget {
  final String fileName;
  final int fileSize;
  final VoidCallback onRemove;
  final bool hasError;
  final int? uploadedFileSize;

  const UploadedFileCard({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.onRemove,
    this.hasError = false, // TODO: Design the error state
    this.uploadedFileSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsPalette.gray50,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.insert_drive_file_outlined,
                color: ColorsPalette.primaryColor,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      uploadedFileSize != null
                          ? '${Helpers.formatFileSize(uploadedFileSize!)} / ${Helpers.formatFileSize(fileSize)}'
                          : Helpers.formatFileSize(fileSize),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: ColorsPalette.gray700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Material(
                      color: Colors.transparent,
                      child: InkResponse(
                        customBorder: const CircleBorder(),
                        onTap: onRemove,
                        child: const Icon(
                          Icons.close,
                          color: ColorsPalette.gray800,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  if (uploadedFileSize != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      _progressText,
                      style: const TextStyle(
                        color: ColorsPalette.gray700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              )
            ],
          ),
          if (uploadedFileSize != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: LinearProgressIndicator(
                value: uploadedFileSize! / fileSize,
                backgroundColor: ColorsPalette.gray300,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String get _progressText {
    final progress = uploadedFileSize! / fileSize * 100;
    return '${progress.toStringAsFixed(2)}%';
  }
}
