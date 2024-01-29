import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/utils/theme/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LCircularImage extends StatelessWidget {
  const LCircularImage({
    super.key,
    this.fit,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = LSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (LHelperFunctions.isDarkMode(context) ? LColors.dark : LColors.light),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  width: width,
                  height: height,
                  fit: fit ?? BoxFit.cover,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) => const LShimerEffect(width: 55, height: 55, radius: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit ?? BoxFit.cover,
                  image: AssetImage(image),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}