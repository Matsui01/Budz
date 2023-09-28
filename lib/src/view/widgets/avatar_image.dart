import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String? url;
  final double radius;
  const AvatarImage({super.key, required this.url, required this.radius});

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return Center(
        child: CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(url!),
        ),
      );
    } else {
      return const Center(
        child: CircleAvatar(
          child: Icon(
            Icons.image,
          ),
        ),
      );
    }
  }
}
