import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
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
        // if img background color is null, then switch it to light and dark mode color design.
        color: backgroundColor ?? (LHelperFunctions.isDarkMode(context) ? LColors.dark : LColors.light),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
