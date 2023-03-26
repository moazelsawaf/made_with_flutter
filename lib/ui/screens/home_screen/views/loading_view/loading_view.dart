import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
          child: Transform.scale(
            scale: 1.5,
            origin: const Offset(25, 0),
            child: LottieBuilder.asset(
              AssetsManager.robotLoading,
            ),
          ),
        ),
        const SizedBox(height: 64),
        const Text(
          'Analyzing ...',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
