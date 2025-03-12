import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';
import '../main_theme/extensions/text_theme_extension.dart';
import '../main_theme/extensions/theme_data_extension.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    this.title,
    this.leadingOnTap,
    this.actions,
    this.bottomDivider = true,
    this.centerTitle = true,
    this.elevation,
    this.bottom,
    this.color,
    this.needBackButton = true,
    this.height,
    super.key,
    this.scrolledUnderElevation = 0,
    this.titleOnTap,
    this.altTitleStyle,
    this.animateDuration,
    this.otherTitle,
  });
  final Widget? otherTitle;
  final Duration? animateDuration;
  final String? title;
  final Widget? bottom;
  final VoidCallback? leadingOnTap;
  final List<Widget>? actions;
  final bool? bottomDivider;
  final VoidCallback? titleOnTap;
  final double? elevation;
  final Color? color;
  final bool needBackButton;
  final double? height;
  final TextStyle? altTitleStyle;
  final double? scrolledUnderElevation;
  final bool centerTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? context.theme.bg,
      surfaceTintColor: color ?? context.theme.bg,
      scrolledUnderElevation: scrolledUnderElevation,
      elevation: elevation ?? 0.2,
      shadowColor: Colors.transparent,
      leading: SizedBox(
        height: 24,
        child: needBackButton
            ? IconButton(
                onPressed: () {
                  if (leadingOnTap == null) {
                    Navigator.pop(context);
                  } else {
                    leadingOnTap!.call();
                  }
                },
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      leadingWidth: 56,
      title: Text(
        title ?? '',
        style: altTitleStyle ??
            context.theme.textTheme.ui16Medium(
              context,
              context.theme.text,
            ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      bottom: bottom != null
          ? PreferredSize(preferredSize: preferredSize, child: bottom!)
          : bottomDivider == true
              ? PreferredSize(
                  preferredSize: preferredSize,
                  child: Divider(
                    color: context.theme.cardShadow,
                    height: 1,
                    thickness: 1,
                  ),
                )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        (height ?? kToolbarHeight) +
            (bottom != null
                ? 40
                : bottomDivider == true
                    ? 1
                    : 0),
      );
}
