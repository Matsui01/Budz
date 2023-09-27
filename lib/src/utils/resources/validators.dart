class Validators {
  String? someText;
  Validators({this.someText});

  String? email(String? text) {
    if ((text == null) || text.isEmpty) return null;
    if (!text.contains('@')) return "E-Mail inválido";
    return null;
  }

  String? name(String? text) {
    if ((text == null) || text.isEmpty) return null;
    final validCharacters = RegExp(r'^[a-zA-Z-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$');
    if (!validCharacters.hasMatch(text)) return "O campo não pode conter símbolos ou números";
    return null;
  }
}
