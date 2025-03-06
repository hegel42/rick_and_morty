import 'package:flutter/material.dart';

import '../shimmer_placeholder.dart';

class TextPlaceholder extends StatelessWidget {
  const TextPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ShimmerPlaceholder(
          isEnabled: true,
          child: SizedBox(
            width: 140,
            height: 25,
          ),
        ),
      ),
    );
  }
}
