import 'package:budz/src/domain/models/user.dart';

import '../../../domain/models/gender.dart';

sealed class ProfileState {}

class ProfileStateLoading extends ProfileState {
  ProfileStateLoading();
}

class ProfileStateSuccess extends ProfileState {
  final User user;
  final Gender? gender;

  ProfileStateSuccess(this.user, [this.gender]);

  ProfileStateSuccess copyWith({User? user, Gender? gender}) {
    return ProfileStateSuccess(user ?? this.user, gender ?? this.gender);
  }
}

class ProfileStateFailed extends ProfileState {
  ProfileStateFailed();
}

class ProfileStateStart extends ProfileState {
  ProfileStateStart();
}
