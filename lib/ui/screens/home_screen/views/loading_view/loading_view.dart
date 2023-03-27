import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

import '../../../../../utils/assets_manager.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          width: 300,
          child: LottieBuilder.asset(
            AssetsManager.filesProcessing,
          ),
        ),
        const SizedBox(height: 64),
        AnimatedTextKit(animatedTexts: [
          TypewriterAnimatedText(
            'Analyzing ...',
            speed: const Duration(milliseconds: 75),
            textStyle: const TextStyle(
              color: ColorsPalette.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ])
      ],
    );
  }
}
