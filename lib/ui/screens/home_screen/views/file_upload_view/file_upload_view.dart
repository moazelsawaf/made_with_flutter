import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

import '../../../../widgets/form/primary_button.dart';
import '../../../../widgets/form/text_input.dart';
import 'file_drop_zone.dart';
import 'uploaded_file_card.dart';

class FileUploadView extends StatelessWidget {
  const FileUploadView({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Upload your APK/ABB file to see whether it was made with Flutter or not',
        ),
        const SizedBox(height: 24),
        const FileDropZone(),
        const SizedBox(height: 24),
        const UploadedFileCard(),
        const SizedBox(height: 24),
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
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Made with Flutter?',
          onPressed: () {},
        ),
      ],
    );
  }
}
