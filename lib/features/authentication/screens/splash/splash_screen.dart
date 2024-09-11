// import "package:applichiamoci/utils/constants/image_strings.dart";
// import "package:applichiamoci/utils/constants/sizes.dart";
// import "package:applichiamoci/utils/helpers/helper_functions.dart";
// import "package:flutter/material.dart";

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final dark = LHelperFunctions.isDarkMode(context);
//     return Scaffold(
//       backgroundColor: dark ? Colors.black : Colors.white,
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             children: [
//               const SizedBox(height: LSizes.spaceBtwSections * 3),
//               const Image(
//                 image: AssetImage(LImages.lightApplogo),
//                 width: 150,
//               ),
//               const SizedBox(
//                 height: LSizes.spaceBtwItems,
//               ),
//               Image(
//                 image: dark
//                     ? const AssetImage(LImages.splashTextdark)
//                     : const AssetImage(LImages.splashTextWhite),
//               ),
//             ],
//           ),
//           Image(
//               image: dark
//                   ? const AssetImage(LImages.splashIconsdark)
//                   : const AssetImage(LImages.splashIconsWhite)),
//         ],
//       ),
//     );
//   }
// }
