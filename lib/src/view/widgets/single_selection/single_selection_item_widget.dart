// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/app_color.dart';
import '../../cubits/single_selection_widget/single_selection_cubit.dart';

class SingleSelectionItemWidget extends StatelessWidget {
  final String text;
  final bool selected;

  const SingleSelectionItemWidget({
    Key? key,
    required this.text,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final singleSelectionCubit = context.read<SingleSelectionCubit>();
    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: ListTileThemeData(
          selectedTileColor: AppColor.selectedColorBackGround,
          shape: selected
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(width: 1),
                ),
        ),
      ),
      child: ListTile(
        selected: selected,
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        onTap: () => singleSelectionCubit.select(text),
        leading: Radio<String>(
          value: text,
          groupValue: singleSelectionCubit.state,
          onChanged: (String? value) => singleSelectionCubit.select(value ?? ''),
        ),
      ),
    );
  }
}
