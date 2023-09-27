import 'package:budz/src/utils/constants/app_sizes.dart';
import 'package:budz/src/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class PictureBottomSheet extends StatelessWidget {
  final _picker = ImagePicker();
  PictureBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button.oulined(
          onPressed: () => _picker.pickImage(source: ImageSource.camera),
          text: 'Tirar foto',
          image: (_) => SvgPicture.asset('assets/icons/camera.svg'),
        ),
        const SizedBox(height: AppSizes.spacing),
        Button.oulined(
          onPressed: () => _picker.pickImage(source: ImageSource.gallery),
          text: 'Escolher foto',
          image: (_) => SvgPicture.asset('assets/icons/picture.svg'),
        ),
      ],
    );
  }
}
