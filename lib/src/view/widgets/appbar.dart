import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);

  final Widget? title;
  final String? toolTip;
  final IconData icon;
  final List<Widget>? actions;
  final void Function()? onPressed;

  const CustomAppbar({
    Key? key,
    this.title,
    this.toolTip = "Voltar",
    this.icon = Icons.arrow_back,
    this.actions,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AppBar(
        title: title,
        centerTitle: true,
        actions: actions,
        leading: IconButton(
          icon: Icon(icon, size: 15),
          tooltip: toolTip,
          onPressed: onPressed ??
              () {
                context.router.pop();
                FocusScope.of(context).unfocus();
              },
        ),
      ),
    );
  }
}
