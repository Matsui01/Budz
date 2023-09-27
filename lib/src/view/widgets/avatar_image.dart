import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String? url;
  final double radius;
  const AvatarImage({super.key, required this.url, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (url != null)
          CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(url!),
          )
        else
          const CircleAvatar(
            child: Icon(
              Icons.add_a_photo_outlined,
            ),
          ),
      ],
    );
  }
}
