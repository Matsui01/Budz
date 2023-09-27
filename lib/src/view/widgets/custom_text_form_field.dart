import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/app_color.dart';
import '../../utils/constants/app_sizes.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController ctrl;
  final String? label;
  final String? hintText;
  final String? helperText;
  final bool enabled;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? mask;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? minLines;

  const CustomTextField({
    super.key,
    required this.ctrl,
    this.label,
    this.hintText,
    this.helperText,
    this.enabled = true,
    this.readOnly = false,
    this.padding,
    this.validator,
    this.mask,
    this.textCapitalization = TextCapitalization.none,
    this.onChange,
    this.onTap,
    this.textInputType,
    this.maxLines = 1,
    this.minLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        controller: ctrl,
        readOnly: readOnly,
        validator: validator ?? (t) => null,
        style: Theme.of(context).textTheme.bodyMedium,
        inputFormatters: mask,
        textCapitalization: textCapitalization,
        onChanged: onChange,
        keyboardType: textInputType,
        maxLines: maxLines,
        minLines: minLines,
        onTap: onTap,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          helperText: helperText,
          // prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: AppSizes.largeIconSize) : null,
          // suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: AppSizes.largeIconSize) : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          // labelStyle: Theme.of(context).textTheme.bodyMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.border),
            borderSide: const BorderSide(width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.border),
            borderSide: const BorderSide(width: 1, color: AppColor.primary),
          ),
        ),
      ),
    );
  }
}
