import 'package:flutter/material.dart';
import 'package:made_with_flutter/ui/screens/home_screen/views/file_upload_view/file_upload_view.dart';

import '../../widgets/base_scaffold/base_scaffold_desktop/base_scaffold_desktop.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldDesktop(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 120,
          vertical: 48,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 500,
            constraints: const BoxConstraints(
              maxHeight: 700,
            ),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const SingleChildScrollView(child: FileUploadView()),
          ),
        ),
      ),
    );
  }
}
