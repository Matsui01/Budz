import '../../view/widgets/custom_dropdown_button.dart';

class Gender extends DropDownItem {
  Gender({required super.dropText});

  String? get text {
    return dropText;
  }

  factory Gender.fromText(String? text) {
    switch (text) {
      case 'Masculino':
        return Gender(dropText: 'Masculino');
      case 'Feminino':
        return Gender(dropText: 'Feminino');
      case 'Outros':
        return Gender(dropText: 'Outros');
      default:
        return Gender(dropText: 'Outros');
    }
  }
}
