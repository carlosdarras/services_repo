import 'package:flutter/material.dart';
import 'package:services_repo/core/theme/app_colors.dart';


class NamesFiled extends StatelessWidget {
  const NamesFiled({
    Key? key,

    ///-----[Controller]-----
    required this.controller,
    this.enabled = true,

    ///-----[Texts]-----
    this.withLabel = false,
    this.label,
    this.labelStyle,
    this.hintText,
    this.hintTextStyle,

    ///-----[Enable_Borders]-----
    this.isFocusedWithBorder = false,
    this.isEnabledWithBorder = false,
    this.isFocusedErrorWithBorder = false,
    this.isErrorWithBorder = false,

    ///-----[Borders_Radius]-----
    this.enabledBorderRadius,
    this.focusedBorderRadius,
    this.focusedErrorBorderRadius,
    this.errorBorderRadius,

    ///-----[Colors]-----
    this.filled,
    this.filledColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,

    ///-----[Methods]-----
    this.onSaved,
    this.onChange,
    this.validator,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
  }) : super(key: key);

  ///-----[Controller]-----
  final TextEditingController controller;
  final bool enabled;

  ///-----[Texts]-----
  final bool? withLabel;
  final String? label;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;

  ///-----[Enable_Borders]-----
  final bool? isFocusedWithBorder;
  final bool? isEnabledWithBorder;
  final bool? isFocusedErrorWithBorder;
  final bool? isErrorWithBorder;

  ///-----[Borders_Radius]-----
  final double? enabledBorderRadius;
  final double? focusedBorderRadius;
  final double? focusedErrorBorderRadius;
  final double? errorBorderRadius;

  ///-----[Colors]-----
  final bool? filled;
  final Color? filledColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;

  ///-----[Methods]-----
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      ///------------------------
      keyboardType: TextInputType.name,

      enabled: enabled,

      ///------------------------
      controller: controller,

      ///------------------------
      validator: validator ??
          (val) {
            if (val!.isEmpty) {
              return "Name must not be empty";
            }
            return null;
          },

      ///------------------------
      onSaved: onSaved ?? (val) {},

      ///------------------------
      onChanged: onChange,

      ///------------------------
      decoration: withLabel!
          ? customInputDecorationWithLabel()
          : customInputDecorationWithoutLabel(),
    );
  }

  InputDecoration customInputDecorationWithLabel() => InputDecoration(
        ///------------------------
        label: Text(label ?? "User Name"),
        labelStyle: labelStyle ?? const TextStyle(),
        hintText: hintText ?? "",
        hintStyle: hintTextStyle ?? const TextStyle(),

        ///------------------------
        filled: filled ?? true,
        fillColor: filledColor ?? myGrey,

        ///------------------------

        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor ?? Colors.grey,
                style:
                    isEnabledWithBorder! ? BorderStyle.solid : BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(enabledBorderRadius ?? 10),
            ),

        ///------------------------
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ?? Colors.blue,
                style:
                    isFocusedWithBorder! ? BorderStyle.solid : BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(focusedBorderRadius ?? 20),
            ),

        ///------------------------
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedErrorBorderColor ?? Colors.red,
                style: isFocusedErrorWithBorder!
                    ? BorderStyle.solid
                    : BorderStyle.none,
              ),
              borderRadius:
                  BorderRadius.circular(focusedErrorBorderRadius ?? 20),
            ),

        ///------------------------
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: errorBorderColor ?? Colors.red,
                style:
                    isErrorWithBorder! ? BorderStyle.solid : BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(errorBorderRadius ?? 20),
            ),
      );

  InputDecoration customInputDecorationWithoutLabel() => InputDecoration(
        ///------------------------
        hintText: hintText ?? "User Name",
        hintStyle: hintTextStyle ?? const TextStyle(),

        ///------------------------
        filled: filled ?? true,
        fillColor: filledColor ?? myGrey,

        ///------------------------

        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor ?? Colors.grey,
                style:
                    isEnabledWithBorder! ? BorderStyle.solid : BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(enabledBorderRadius ?? 10),
            ),

        ///------------------------
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ?? Colors.blue,
                style:
                    isFocusedWithBorder! ? BorderStyle.solid : BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(focusedBorderRadius ?? 20),
            ),

        ///------------------------
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedErrorBorderColor ?? Colors.red,
                style: isFocusedErrorWithBorder!
                    ? BorderStyle.solid
                    : BorderStyle.none,
              ),
              borderRadius:
                  BorderRadius.circular(focusedErrorBorderRadius ?? 20),
            ),

        ///------------------------
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: errorBorderColor ?? Colors.red,
                style:
                    isErrorWithBorder! ? BorderStyle.solid : BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(errorBorderRadius ?? 20),
            ),
      );
}
