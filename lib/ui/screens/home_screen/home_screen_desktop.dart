import 'package:flutter/material.dart';

import '../../widgets/base_scaffold/base_scaffold_desktop/base_scaffold_desktop.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffoldDesktop(
      child: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
