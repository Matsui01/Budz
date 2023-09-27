import 'package:budz/src/view/cubits/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/env.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/app_themes.dart';
import 'src/domain/repositories/profile_repository.dart';
import 'src/get_it.dart';

void main() => mainCommon(Env.MOCK);

Future<void> mainCommon(Env env) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(env);
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(
            getIt<ProfileRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: EnvInfo.appName,
        theme: AppTheme.light,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
