import 'package:budz/src/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_color.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Tem certeza que deseja encerrar a jornada do seu melhor amigo?',
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
        SvgPicture.asset('assets/images/sad.svg'),
        Text(
          'Todas as suas informações e a evolução do seu pet no aplicativo serão apagadas. Essa ação não pode ser desfeita.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSizes.contentSpacing,
        ),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(backgroundColor: AppColor.red),
            child: const Text(
              'EXCLUIR CONTA',
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'CANCELAR',
              style: TextStyle(color: AppColor.primary),
            ),
          ),
        ),
      ],
    );
  }
}
