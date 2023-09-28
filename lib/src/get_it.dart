import 'package:budz/src/config/env.dart';
import 'package:budz/src/utils/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'data/datasource/profile_datasource.dart';
import 'data/repositories/mock/profile_repository_impl_mock.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'utils/resources/dio_interceptor.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  switch (EnvInfo.env) {
    case Env.DEV:
      _initDev();
      break;
    case Env.MOCK:
      _initMock();
      break;
    case Env.PROD:
      _initDev();
      break;
  }
}

void _initDev() {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, error: true));
  dio.interceptors.add(CustomInterceptors());
  dio.options = BaseOptions(baseUrl: baseUrl);

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<Logger>(Logger());

  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(profileDatasource: ProfileDatasource(getIt<Dio>())),
  );
}

void _initMock() {
  getIt.registerSingleton<Logger>(Logger());

  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImplMock(),
  );
}
