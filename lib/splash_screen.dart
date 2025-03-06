import 'package:flutter/material.dart';

import 'common/extensions/context_extension.dart';
import 'common/gen/assets.gen.dart';
import 'common/main_theme/extensions/theme_data_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.bg,
      body: Center(
        child: Assets.svg.logo.svg(
          height: 80,
          width: 80,
        ),
      ),
    );
  }
}
