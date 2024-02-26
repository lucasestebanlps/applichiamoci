import 'package:flutter/material.dart';
import 'package:applichiamoci/features/screens/home/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel home;

  const NewsDetailScreen({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(
          home.title,
          style: Theme.of(context).textTheme.headlineSmall!,
        ),
      ),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: LSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            if (home.image != null &&
                home.image!.isNotEmpty) // Verifica si la imagen está disponible
              Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: CachedNetworkImage(
                      imageUrl: home.image!,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LShimerEffect(
                        width: double.infinity,
                        height: 300,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            if (home.image != null) const SizedBox(height: LSizes.md),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: LSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    home.title.replaceAll(r'\n', '\n'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: LSizes.sm),

                  // Subtitle
                  Text(
                    home.subtitle.replaceAll(r'\n', '\n'),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: LSizes.sm),

                  const Divider(),

                  const SizedBox(height: LSizes.sm),

                  // Description
                  Text(
                    home.description.replaceAll(r'\n', '\n'),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: LSizes.spaceBtwSections),

                  // Action Buttons
                  ActionButtons(
                    callActionParameter: home.phoneNumber,
                    mapActionParameter: home.mapCoordinates,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
