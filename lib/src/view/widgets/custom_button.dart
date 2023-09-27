import 'package:budz/src/utils/constants/app_color.dart';
import 'package:budz/src/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

abstract class Button extends StatelessWidget {
  final String? text;
  final void Function() onPressed;
  final WidgetBuilder? image;
  final ButtonStyle? buttonStyle;

  const Button({super.key, this.text, required this.onPressed, this.image, this.buttonStyle});

  const factory Button.oulined({
    WidgetBuilder? image,
    required void Function() onPressed,
    String? text,
    ButtonStyle? buttonStyle,
  }) = _OutlinedButton;
}

class _OutlinedButton extends Button {
  const _OutlinedButton({required super.onPressed, super.image, super.text, super.buttonStyle});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            if (image != null) image!(context),
            const SizedBox(width: AppSizes.spacing),
            Expanded(
              child: Text(
                text ?? '',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.black,
              size: AppSizes.icon,
            ),
          ],
        ),
      ),
    );
  }
}
