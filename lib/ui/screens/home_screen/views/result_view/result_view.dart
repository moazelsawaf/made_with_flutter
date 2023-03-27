import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/home_cubit/home_cubit.dart';
import '../../../../../utils/colors_palette.dart';
import '../../../../widgets/form/primary_button.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final result = state as HomeResult;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              result.madeWithFlutter ? 'Yeah!' : 'Nope!',
              style: const TextStyle(
                color: ColorsPalette.primaryColor,
                fontSize: 64,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 42),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (result.appIconBytes != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.memory(
                        result.appIconBytes!,
                        height: 65,
                        width: 65,
                      ),
                    ),
                    const SizedBox(width: 26),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          result.applicationName,
                          style: const TextStyle(
                            color: ColorsPalette.gray900,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 42),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  result.madeWithFlutter
                      ? 'is made with Flutter!'
                      : 'is not made with Flutter!',
                  speed: const Duration(milliseconds: 50),
                  textStyle: const TextStyle(
                    color: ColorsPalette.gray900,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 42),
            PrimaryButton(
              label: 'Start Over',
              onPressed: context.read<HomeCubit>().reset,
            )
          ],
        );
      },
    );
  }
}
