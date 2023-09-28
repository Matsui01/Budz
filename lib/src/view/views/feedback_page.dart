import 'package:auto_route/auto_route.dart';
import 'package:budz/src/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/appbar.dart';

@RoutePage()
class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        icon: Icons.close,
        onPressed: () {
          context.router.popUntilRoot();
        },
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.spacing),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/bye.svg',
              ),
              const SizedBox(height: AppSizes.contentSpacing),
              Text(
                'Sua conta foi excluída',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spacing),
              Text(
                'É uma pena ver você indo embora! Mas fica tranquilo, estaremos de braços abertos caso queira voltar. Até logo! 💙',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppSizes.spacing),
        width: double.infinity,
        child: FilledButton(
          onPressed: () {
            context.router.popUntilRoot();
          },
          child: const Text(
            'CONTINUAR',
          ),
        ),
      ),
    );
  }
}
