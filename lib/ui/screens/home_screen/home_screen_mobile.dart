import 'package:flutter/material.dart';

import '../../widgets/base_scaffold/base_scaffold_mobile/base_scaffold_mobile.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffoldMobile(
      child: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
