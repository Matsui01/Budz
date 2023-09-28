import 'package:budz/src/domain/models/pet.dart';
import 'package:budz/src/domain/models/responses/profile_response.dart';
import 'package:budz/src/domain/models/user.dart';

import '../../../domain/models/requests/profile_request.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../../utils/resources/api_response.dart';

class ProfileRepositoryImplMock implements ProfileRepository {
  @override
  Future<ApiResponse<ProfileResponse>> getProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiSuccess(
      ProfileResponse(
        pets: [
          Pet(id: '48E792A6-EF69-467E-B9FB-E4C272AE23AF'),
          Pet(id: 'B05C4E66-4E5E-4B4D-8BDE-B7AFC9F476FF'),
        ],
        user: User(
          id: '48E792A6-EF69-467E-B9FB-E4C272AE23AF',
          email: 'paulo.matsui@teste.com',
          fullname: 'Paulo Matsui',
          gender: 'Masculino',
          nickname: 'J',
          photoUrl: 'https://picsum.photos/300/300',
        ),
      ),
    );
  }

  @override
  Future<ApiResponse<ProfileResponse>> saveProfile(ProfileRequest profileRequest) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiSuccess(ProfileResponse(
      pets: [
        Pet(id: '48E792A6-EF69-467E-B9FB-E4C272AE23AF'),
        Pet(id: 'B05C4E66-4E5E-4B4D-8BDE-B7AFC9F476FF'),
      ],
      user: User(
        id: '48E792A6-EF69-467E-B9FB-E4C272AE23AF',
        email: 'paulo.matsui@teste.com',
        fullname: 'Paulo Matsui',
        gender: 'Masculino',
        nickname: 'J',
        photoUrl: 'https://picsum.photos/300/300',
      ),
    ));
  }

  @override
  Future<ApiResponse<void>> deleteAccount() async {
    return const ApiSuccess(null);
  }
}
