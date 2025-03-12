import 'package:flutter/material.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../../common/widgets/app_gesture_detector.dart';
import '../../../../data/models/characters_response.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: () {},
      alternativeDecoration: BoxDecoration(
        color: context.theme.border,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                character.image ?? '',
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.status ?? '',
                    style: context.theme.textTheme
                        .ui16Medium(context, context.theme.accent),
                  ),
                  Text(
                    character.name ?? '',
                    style: context.theme.textTheme
                        .ui18Medium(context, context.theme.text),
                  ),
                  Text(
                    character.gender ?? '',
                    style: context.theme.textTheme
                        .ui14Regular(context, context.theme.accent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
