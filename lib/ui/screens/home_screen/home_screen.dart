import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../cubits/home_cubit/home_cubit.dart';
import 'home_screen_desktop.dart';
import 'home_screen_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: ScreenTypeLayout.builder(
        mobile: (context) => const HomeScreenMobile(),
        tablet: (context) => const HomeScreenDesktop(),
        desktop: (context) => const HomeScreenDesktop(),
      ),
    );
  }
}
