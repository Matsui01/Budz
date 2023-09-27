class User {
  final String id;
  final String email;
  final String? fullname;
  final String? photoUrl;
  final String? nickname;
  final String? gender;

  User({
    required this.id,
    required this.email,
    this.fullname,
    this.photoUrl,
    this.nickname,
    this.gender,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      id: map['id'] as String,
      fullname: map['fullname'] as String?,
      photoUrl: map['photoUrl'] as String?,
      nickname: map['nickname'] as String?,
      gender: map['gender'] as String?,
    );
  }
}
