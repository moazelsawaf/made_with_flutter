import 'package:flutter/material.dart';

import '../../widgets/base_scaffold/base_scaffold_mobile/base_scaffold_mobile.dart';
import '../../widgets/credits.dart';
import 'views/file_upload_view/file_upload_view.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldMobile(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.all(24),
            sliver: SliverToBoxAdapter(
              child: FileUploadView(),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Credits(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
