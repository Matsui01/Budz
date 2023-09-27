import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:budz/src/utils/constants/app_color.dart';
import 'package:budz/src/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/models/user.dart';
import '../cubits/profile/profile_cubit.dart';
import '../cubits/profile/profile_state.dart';
import '../widgets/avatar_image.dart';
import '../widgets/custom_button.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    scheduleMicrotask(() => context.read<ProfileCubit>().getProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch (state.runtimeType) {
          case ProfileStateSuccess:
            return _BuildProfile(
              user: (state as ProfileStateSuccess).user,
            );
          case ProfileStateLoading:
            return const Center(child: CircularProgressIndicator());
          case ProfileStateFailed:
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Erro, tente novamente mais tarde'),
                Icon(Icons.refresh),
              ],
            );
          case ProfileStateStart:
            return const SizedBox();
          default:
            return const Center(child: Text('Página vazia'));
        }
      },
    );
  }
}

class _BuildProfile extends StatelessWidget {
  final User user;
  const _BuildProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            color: AppColor.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSizes.spacing),
                  child: Row(
                    children: [
                      AvatarImage(
                        url: user.photoUrl,
                        radius: 28,
                      ),
                      const SizedBox(width: AppSizes.spacing),
                      Text(user.nickname ?? '', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Theme(
            data: ThemeData(
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  backgroundColor: AppColor.white,
                ),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(AppSizes.spacing),
              children: [
                Button.oulined(
                  onPressed: () {},
                  text: 'Meus Pets',
                  image: (_) => SvgPicture.asset('assets/icons/pet.svg'),
                  buttonStyle: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSizes.border16),
                        topRight: Radius.circular(AppSizes.border16),
                      ),
                    ),
                  ),
                ),
                Button.oulined(
                  onPressed: () {},
                  text: 'Editar Perfil',
                  image: (_) => SvgPicture.asset('assets/icons/person.svg'),
                ),
                Button.oulined(
                  onPressed: () {},
                  text: 'Ferramentas',
                  image: (_) => SvgPicture.asset(
                    'assets/icons/tools.svg',
                  ),
                ),
                Button.oulined(
                  onPressed: () {},
                  text: 'Gerenciar Assinatura',
                  image: (_) => SvgPicture.asset('assets/icons/crown.svg'),
                ),
                Button.oulined(
                  onPressed: () {},
                  text: 'Alterar Senha',
                  image: (_) => SvgPicture.asset('assets/icons/lock.svg'),
                  buttonStyle: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppSizes.border16),
                        bottomRight: Radius.circular(AppSizes.border16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.contentSpacing),
                Button.oulined(
                  onPressed: () {},
                  text: 'Alterar Senha',
                  image: (_) => SvgPicture.asset('assets/icons/lock.svg'),
                  buttonStyle: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(AppSizes.border16)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
