import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../../../utils/colors_palette.dart';
import '../../../../widgets/form/primary_button.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Yeah!',
          style: TextStyle(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://cdn2.iconfinder.com/data/icons/2018-social-media-app-logos/1000/2018_social_media_popular_app_logo_youtube-512.png',
                  height: 65,
                  width: 65,
                ),
              ),
              const SizedBox(width: 26),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Youtube',
                      style: TextStyle(
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
              'is made with Flutter!',
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
          onPressed: () {},
        )
      ],
    );
  }
}
