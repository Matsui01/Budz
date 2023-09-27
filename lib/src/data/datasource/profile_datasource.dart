import 'package:budz/src/domain/models/requests/profile_request.dart';
import 'package:budz/src/domain/models/responses/profile_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/constants/strings.dart';

part 'profile_datasource.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class ProfileDatasource {
  factory ProfileDatasource(Dio dio, {String baseUrl}) = _ProfileDatasource;

  @POST('/profile')
  Future<HttpResponse<ProfileResponse>> getProfile();

  @POST('/save-profile')
  Future<HttpResponse<ProfileResponse>> saveProfile(ProfileRequest profileRequest);

  @POST('/delete-account')
  Future<HttpResponse<void>> deleteAcoount();
}
