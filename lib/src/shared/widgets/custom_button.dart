import 'package:flutter/material.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({
    required this.buttonText, super.key,
    this.onPressed,
    this.transparent = false,
    this.margin,
    this.width,
    this.height,
    this.fontSize,
    this.radius = 5,
    this.icon, this.isLoading = false, this.imageIcon, this.iconColor, this.iconSize,
  });
  final Function()? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final IconData? icon;
  final bool isLoading;
  final String? imageIcon;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null ? Theme.of(context).disabledColor : transparent
          ? Colors.transparent : Theme.of(context).primaryColor,
      minimumSize: Size(width != null ? width! : maxWidth, height != null ? height! : 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: onPressed == null
            ? Theme.of(context).disabledColor : Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return Center(child: SizedBox(width: width ?? maxWidth, child: Padding(
      padding: margin == null ? const EdgeInsets.all(0) : margin!,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: flatButtonStyle,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [

          if ((icon != null || imageIcon != null) && !isLoading) Padding(
            padding: const EdgeInsets.only(right: Dimensions.spacingExtraSmall),
            child:  imageIcon != null
                ? Image.asset(imageIcon!, height: iconSize ?? 20, color: iconColor)
                : Icon(icon, color: transparent ? Theme.of(context).primaryColor
                : Theme.of(context).cardColor),
          ) else const SizedBox(),


          if (isLoading) Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.spacingSmall),
            child: SizedBox(
              height:  fontSize ?? Dimensions.fontSizeDefault,
              width:  fontSize ?? Dimensions.fontSizeDefault,
              child: CircularProgressIndicator(
                strokeWidth : 2,
                color: transparent ? Theme.of(context).primaryColor : Colors.white,
              ),
            ),
          ) else const SizedBox(),


          Text(
              isLoading ? context.l10n.loading : buttonText ??'',
              textAlign: TextAlign.center,
              style: robotoRegular.copyWith(
            color: transparent ?  Theme.of(context).primaryColor : Colors.white,
            fontSize: fontSize ?? Dimensions.fontSizeLarge,
          )),
        ]),
      ),
    )));
  }
}