import 'package:budz/src/domain/models/requests/profile_request.dart';
import 'package:budz/src/domain/models/responses/profile_response.dart';
import 'package:budz/src/view/cubits/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/gender.dart';
import '../../../domain/models/user.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../../utils/resources/api_response.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _companyRepository;

  ProfileCubit(this._companyRepository) : super(ProfileStateStart());

  Gender? get gender {
    if (state is ProfileStateSuccess) return (state as ProfileStateSuccess).gender;
    return null;
  }

  void setGender(Gender? gender) {
    switch (state) {
      case ProfileStateSuccess():
        emit((state as ProfileStateSuccess).copyWith(gender: gender));
        break;
      default:
    }
  }

  void setProfile(User user) {
    emit(
      ProfileStateSuccess(
        user,
        user.gender != null ? Gender.fromText(user.gender) : null,
      ),
    );
  }

  Future getProfile() async {
    emit(ProfileStateLoading());
    ApiResponse<ProfileResponse> apiResponse = await _companyRepository.getProfile();

    switch (apiResponse) {
      case ApiSuccess():
        final user = apiResponse.data!.user;
        emit(ProfileStateSuccess(
          user,
          user.gender != null ? Gender.fromText(apiResponse.data!.user.gender) : null,
        ));
      case ApiError():
        emit(ProfileStateFailed());
      default:
        emit(ProfileStateFailed());
    }
  }

  Future saveProfile(ProfileRequest profileRequest) async {
    emit(ProfileStateLoading());
    ApiResponse<ProfileResponse> apiResponse = await _companyRepository.saveProfile(profileRequest);

    switch (apiResponse) {
      case ApiSuccess():
        final user = apiResponse.data!.user;
        emit(ProfileStateSuccess(
          user,
          user.gender != null ? Gender.fromText(apiResponse.data!.user.gender) : null,
        ));
      case ApiError():
        emit(ProfileStateFailed());
      default:
        emit(ProfileStateFailed());
    }
  }

  Future<bool> deleteAccount() async {
    ApiResponse<void> apiResponse = await _companyRepository.deleteAccount();

    switch (apiResponse) {
      case ApiSuccess():
        return true;
      case ApiError():
        return false;
      default:
        return false;
    }
  }
}
