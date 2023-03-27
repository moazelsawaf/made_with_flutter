import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:made_with_flutter/ui/screens/home_screen/views/file_upload_view/file_upload_view.dart';

import '../../../cubits/home_cubit/home_cubit.dart';
import '../../widgets/base_scaffold/base_scaffold_desktop/base_scaffold_desktop.dart';
import 'views/loading_view/loading_view.dart';
import 'views/result_view/result_view.dart';

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
            child: SingleChildScrollView(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: LoadingView(),
                    );
                  } else if (state is HomeResult) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: ResultView(),
                    );
                  } else {
                    return const FileUploadView();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
