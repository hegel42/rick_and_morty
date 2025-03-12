import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/context_extension.dart';
import '../main_theme/extensions/text_theme_extension.dart';
import '../main_theme/extensions/theme_data_extension.dart';

class MainAppTextField extends StatefulWidget {
  const MainAppTextField({
    super.key,
    this.errorText,
    this.hintText,
    this.controller,
    this.suffixWidget,
    this.focus,
    this.isFieldWithCurrency = false,
    this.isRequired = false,
    this.enabled = true,
    this.maxLength,
    this.onChange,
    this.autoFocus,
    this.decoration,
    this.prefixIcon,
    this.hideBorder = false,
    this.onSubmitted,
  });

  final bool isFieldWithCurrency;
  final String? errorText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? isRequired;
  final int? maxLength;
  final bool enabled;
  final Widget? suffixWidget;
  final Widget? prefixIcon;
  final Function(String?)? onChange;
  final Function(String?)? onSubmitted;
  final FocusNode? focus;
  final bool? autoFocus;
  final InputDecoration? decoration;
  final bool hideBorder;

  @override
  State<MainAppTextField> createState() => _MainAppTextFieldState();
}

class _MainAppTextFieldState extends State<MainAppTextField> {
  bool? _obscurePassword;
  bool fieldIsEmpty = true;

  List<TextInputFormatter>? inputFormatters;
  TextInputType? type;
  List<TextInputFormatter>? formatters;
  @override
  void initState() {
    widget.controller?.addListener(() {
      if ((widget.controller?.text.isNotEmpty ?? false) &&
          fieldIsEmpty &&
          mounted) {
        setState(() {
          fieldIsEmpty = false;
        });
      }
      if ((widget.controller?.text.isEmpty ?? false) &&
          !fieldIsEmpty &&
          mounted) {
        setState(() {
          fieldIsEmpty = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO рефактор, через валидацию формы и метод autoValidate + красную рамку
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style:
              context.theme.textTheme.ui16Medium(context, context.theme.text),
          controller: widget.controller,
          focusNode: widget.focus,
          textCapitalization: TextCapitalization.sentences,
          enabled: widget.enabled,
          onChanged: (value) => widget.onChange?.call(value),
          onFieldSubmitted: (value) => widget.onSubmitted?.call(value),
          keyboardType: type,
          inputFormatters: formatters,
          obscureText: _obscurePassword ?? false,
          cursorColor: context.theme.accent,
          maxLength: widget.maxLength,
          autofocus: widget.autoFocus ?? false,
          decoration: widget.decoration ??
              InputDecoration(
                filled: true,
                hintStyle: context.theme.textTheme
                    .ui16Regular(context, context.theme.border),
                hintText: widget.hintText,
                errorText: widget.errorText,
                counterStyle: context.theme.textTheme.ui12Regular(
                  context,
                  context.theme.border,
                ),
                fillColor: context.theme.altText,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.theme.accent),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
                prefixIcon: widget.prefixIcon != null
                    ? Align(
                        alignment: Alignment.bottomLeft,
                        widthFactor: 1,
                        child: widget.prefixIcon,
                      )
                    : null,
                prefixIconConstraints: const BoxConstraints(maxHeight: 24),
                suffixIcon: widget.suffixWidget,
                isDense: true,
                suffixIconConstraints: const BoxConstraints(maxHeight: 24),
                contentPadding: const EdgeInsets.only(
                  bottom: 14,
                  top: 14,
                  left: 16,
                  right: 16,
                ),
              ),
        ),
      ],
    );
  }
}
