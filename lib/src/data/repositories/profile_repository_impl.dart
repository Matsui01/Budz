import 'package:budz/src/domain/models/responses/profile_response.dart';

import '../../domain/models/requests/profile_request.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../utils/resources/api_response.dart';
import '../datasource/profile_datasource.dart';
import 'base/base_api_repository.dart';

class ProfileRepositoryImpl extends BaseApiRepository implements ProfileRepository {
  final ProfileDatasource profileDatasource;

  ProfileRepositoryImpl({
    required this.profileDatasource,
  });

  @override
  Future<ApiResponse<ProfileResponse>> getProfile() async {
    return await getResponse<ProfileResponse>(
      request: () => profileDatasource.getProfile(),
    );
  }

  @override
  Future<ApiResponse<ProfileResponse>> saveProfile(ProfileRequest profileRequest) async {
    return await getResponse<ProfileResponse>(
      request: () => profileDatasource.saveProfile(
        email: profileRequest.email,
        gender: profileRequest.gender,
        name: profileRequest.name,
      ),
    );
  }

  @override
  Future<ApiResponse<void>> deleteAccount() async {
    return await getResponse(
      request: () => profileDatasource.deleteAcoount(),
    );
  }
}
