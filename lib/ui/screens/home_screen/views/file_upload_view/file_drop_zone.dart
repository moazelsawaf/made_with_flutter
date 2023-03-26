import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

class FileDropZone extends StatefulWidget {
  const FileDropZone({
    super.key,
  });

  @override
  State<FileDropZone> createState() => _FileDropZoneState();
}

class _FileDropZoneState extends State<FileDropZone> {
  bool isDraggedOver = false;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding: EdgeInsets.zero,
      radius: const Radius.circular(6),
      borderType: BorderType.RRect,
      dashPattern: isDraggedOver ? [6, 0] : [6, 3],
      color: isDraggedOver ? ColorsPalette.primaryColor : ColorsPalette.gray500,
      strokeWidth: isDraggedOver ? 1.5 : 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isDraggedOver
              ? ColorsPalette.primaryColor.withOpacity(0.05)
              : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: const [
              Icon(
                Icons.file_upload_outlined,
                color: ColorsPalette.gray700,
                size: 30,
              ),
              SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Drag & Drop or'),
                    TextSpan(
                      text: ' Choose File ',
                      style: TextStyle(
                        color: ColorsPalette.primaryColor,
                      ),
                    ),
                    TextSpan(text: 'to upload')
                  ],
                  style: TextStyle(
                    color: ColorsPalette.gray900,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                'APK or ABB',
                style: TextStyle(
                  color: ColorsPalette.gray600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
