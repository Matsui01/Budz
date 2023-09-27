import 'package:auto_route/auto_route.dart';
import 'package:budz/src/domain/models/gender.dart';
import 'package:budz/src/domain/models/requests/profile_request.dart';
import 'package:budz/src/utils/constants/app_sizes.dart';
import 'package:budz/src/utils/resources/validators.dart';
import 'package:budz/src/view/cubits/profile/profile_cubit.dart';
import 'package:budz/src/view/widgets/appbar.dart';
import 'package:budz/src/view/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/user.dart';
import '../../utils/constants/app_color.dart';
import '../cubits/profile/profile_state.dart';
import '../widgets/custom_text_form_field.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileCubit>().getProfile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Editar Perfil",
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
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
      ),
    );
  }
}

class _BuildProfile extends StatefulWidget {
  final User user;
  const _BuildProfile({required this.user});

  @override
  State<_BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<_BuildProfile> {
  final _nameCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _validators = Validators();

  final _genderValues = [
    Gender(dropText: 'Masculino'),
    Gender(dropText: 'Feminino'),
    Gender(dropText: 'Outros'),
  ];

  @override
  void initState() {
    _nameCtrl.text = widget.user.nickname ?? '';
    _emailCtrl.text = widget.user.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacing),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AvatarImage(
                url: widget.user.photoUrl,
              ),
              const SizedBox(height: AppSizes.contentSpacing),
              Text('Nome', style: Theme.of(context).textTheme.titleSmall),
              CustomTextField(
                ctrl: _nameCtrl,
                padding: const EdgeInsets.only(top: AppSizes.childSpacing),
                textCapitalization: TextCapitalization.words,
                validator: _validators.name,
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: AppSizes.contentSpacing),
              Text('Email', style: Theme.of(context).textTheme.titleSmall),
              CustomTextField(
                ctrl: _emailCtrl,
                padding: const EdgeInsets.only(top: AppSizes.childSpacing),
                textInputType: TextInputType.emailAddress,
                validator: _validators.email,
              ),
              const SizedBox(height: AppSizes.contentSpacing),
              Text('Gênero', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: AppSizes.childSpacing),
              CustomDropdownButton(
                hint: 'Selecione uma opção',
                list: _genderValues,
                onChanged: (value) {
                  context.read<ProfileCubit>().setGender(value as Gender?);
                },
              ),
              const SizedBox(height: AppSizes.contentSpacing),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    context.read<ProfileCubit>().saveProfile(
                          ProfileRequest(
                            email: _emailCtrl.text,
                            name: _nameCtrl.text,
                            gender: context.read<ProfileCubit>().gender?.text,
                          ),
                        );
                  },
                  child: const Text(
                    'SALVAR',
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Excluir conta',
                    style: TextStyle(color: AppColor.font),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  final String? url;
  const _AvatarImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (url != null)
          CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(url!),
          )
        else
          const CircleAvatar(
            child: Icon(
              Icons.add_a_photo_outlined,
            ),
          ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: const Text('ALTERAR FOTO'),
          ),
        ),
      ],
    );
  }
}
