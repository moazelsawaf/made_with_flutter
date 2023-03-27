import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/home_cubit/home_cubit.dart';
import '../../widgets/base_scaffold/base_scaffold_mobile/base_scaffold_mobile.dart';
import '../../widgets/credits.dart';
import 'views/file_upload_view/file_upload_view.dart';
import 'views/loading_view/loading_view.dart';
import 'views/result_view/result_view.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldMobile(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const LoadingView();
                  } else if (state is HomeResult) {
                    return const ResultView();
                  } else {
                    return const FileUploadView();
                  }
                },
              ),
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
