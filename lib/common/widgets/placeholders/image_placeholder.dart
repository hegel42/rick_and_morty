import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../gen/assets.gen.dart';
import '../../main_theme/extensions/theme_data_extension.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    this.fit = BoxFit.contain,
    this.rounded = true,
    this.padding,
  });

  final BoxFit fit;
  final bool rounded;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 80),
      decoration: BoxDecoration(
        color: context.theme.border,
        borderRadius: BorderRadius.all(
          Radius.circular(rounded ? 16 : 0),
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: Assets.svg.newsPlaceholder.svg(fit: fit),
        ),
      ),
    );
  }
}
