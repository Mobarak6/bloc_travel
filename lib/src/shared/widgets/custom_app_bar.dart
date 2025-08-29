import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.isBackButtonExist = true,
    this.onBackPressed,
  });

  final String title;
  final bool isBackButtonExist;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title, style: robotoMedium.copyWith(
        fontSize: Dimensions.fontSizeExtraLarge,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      )),
      centerTitle: true,
      backgroundColor: Theme.of(context).cardColor,
      shadowColor: Theme.of(context).cardColor,
      surfaceTintColor: Theme.of(context).cardColor,
      elevation: 2,
      leading: isBackButtonExist ? IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Theme.of(context).textTheme.bodyLarge?.color,
        onPressed: onBackPressed != null
            ? ()=> onBackPressed!() : ()=> context.back(),
      ) : const SizedBox(),


    );
  }

  @override
  Size get preferredSize => const Size(1200, 50);
}
