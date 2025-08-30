import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/src/shared/assets/assets.gen.dart';



class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    required this.image, super.key,
    this.height, this.width, this.fit = BoxFit.cover,
    this.placeholder,
  });
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image, height: height, width: width, fit: fit,
      placeholder: (context, url) => Image.asset(
        placeholder == null ? placeholder! : Assets.images.placeHolder.path,
        height: height,
        width: width,
        fit: fit,
      ),
      errorWidget: (context, url, error) => Image.asset(
        placeholder != null ? placeholder! : Assets.images.placeHolder.path,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
