import 'package:auto_route/auto_route.dart';
import 'package:budz/src/config/router/app_router.dart';
import 'package:budz/src/utils/constants/app_sizes.dart';
import 'package:budz/src/view/widgets/single_selection/single_selection_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/single_selection_widget/single_selection_cubit.dart';
import '../widgets/appbar.dart';

@RoutePage()
class DeleteFeedbackPage extends StatefulWidget {
  const DeleteFeedbackPage({super.key});

  @override
  State<DeleteFeedbackPage> createState() => _DeleteFeedbackPageState();
}

class _DeleteFeedbackPageState extends State<DeleteFeedbackPage> {
  List<String> values = [
    'Eu não uso mais o Budz',
    'Valores das assinaturas',
    'Insatisfação com os serviços oferecidos',
    'Tive problemas técnicos',
    'Conteúdos ruins ou irrelevantes',
    'Experiência e usabilidade',
    'Outro',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SingleSelectionCubit(values[0], values),
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: BlocBuilder<SingleSelectionCubit, String>(
          builder: (context, state) {
            return ListView.separated(
              padding: const EdgeInsets.all(AppSizes.spacing),
              itemBuilder: (context, i) {
                if (i == 0) {
                  return Column(
                    children: [
                      Text(
                        'Conta pra gente, qual o motivo da exclusão?',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSizes.contentSpacing),
                      SingleSelectionItemWidget(text: values[i], selected: state == values[i]),
                    ],
                  );
                }
                return SingleSelectionItemWidget(text: values[i], selected: state == values[i]);
              },
              separatorBuilder: (_, i) => const SizedBox(height: AppSizes.spacing),
              itemCount: values.length,
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(AppSizes.spacing),
          width: double.infinity,
          child: FilledButton(
            onPressed: () {
              context.router.push(const FeedbackRoute());
            },
            child: const Text(
              'CONTINUAR',
            ),
          ),
        ),
      ),
    );
  }
}
