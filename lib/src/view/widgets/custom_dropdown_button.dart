// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_sizes.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hint;
  final List<DropDownItem> list;
  final DropDownItem? selectedItem;
  final void Function(DropDownItem?)? onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.hint,
    required this.list,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(Icons.keyboard_arrow_down),
      hint: Text(
        'Selecione uma opção',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      value: selectedItem,
      style: Theme.of(context).textTheme.bodyMedium,
      borderRadius: const BorderRadius.all(Radius.circular(AppSizes.border)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.border),
          borderSide: const BorderSide(width: 1),
        ),
      ),
      onChanged: onChanged,
      items: list.map<DropdownMenuItem<DropDownItem>>((DropDownItem value) {
        return DropdownMenuItem<DropDownItem>(
          value: value,
          child: Text(value.dropText),
        );
      }).toList(),
    );
  }
}

abstract class DropDownItem extends Equatable {
  final String dropText;

  const DropDownItem({
    required this.dropText,
  });

  @override
  List<Object> get props => [dropText];
}
