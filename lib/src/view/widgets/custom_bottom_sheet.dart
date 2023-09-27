import 'package:auto_route/auto_route.dart';
import 'package:budz/src/utils/constants/app_color.dart';
import 'package:budz/src/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

Future showCustomBottomSheet(BuildContext context, WidgetBuilder builder, [bool isScrollControlled = false]) async {
  await showModalBottomSheet<void>(
    context: context,
    enableDrag: true,
    isScrollControlled: isScrollControlled,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          right: AppSizes.childSpacing,
          left: AppSizes.childSpacing,
          top: AppSizes.childSpacing,
          bottom: AppSizes.contentSpacing,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const _DragHandle(),
            const SizedBox(height: AppSizes.contentSpacing),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.childSpacing),
              child: builder(context),
            ),
          ],
        ),
      );
    },
  );
}

class _DragHandle extends StatelessWidget {
  const _DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Flexible(
          flex: 1,
          child: Container(
            height: 4,
            width: 64,
            decoration: const BoxDecoration(
              color: AppColor.black,
              borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.border),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => context.router.pop(),
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }
}
