class Pet {
  final String id;

  Pet({required this.id});

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id'] as String,
    );
  }
}
