import '../../utils/resources/api_response.dart';
import '../models/requests/profile_request.dart';
import '../models/responses/profile_response.dart';

abstract class ProfileRepository {
  Future<ApiResponse<ProfileResponse>> getProfile();
  Future<ApiResponse<ProfileResponse>> saveProfile(ProfileRequest profileRequest);
  Future<ApiResponse<void>> deleteAccount();
}
