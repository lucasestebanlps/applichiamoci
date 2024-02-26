import 'package:flutter/material.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:applichiamoci/features/screens/categories/models/place_model.dart';

class PlaceDetailScreen extends StatelessWidget {
  final PlaceModel place;

  const PlaceDetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(
          place.title,
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
            if (place.image != null &&
                place
                    .image!.isNotEmpty) // Verifica si la imagen está disponible
              Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: CachedNetworkImage(
                      imageUrl: place.image!,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LShimerEffect(
                        width: double.infinity,
                        height: 250,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ],
              ),

            if (place.image != null) const SizedBox(height: LSizes.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: LSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    place.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: LSizes.sm),

                  // Owner
                  if (place.ownerName != null && place.ownerName!.isNotEmpty)
                    Column(children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          const SizedBox(width: LSizes.spaceBtwItems),
                          Text(
                            place.ownerName!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: LSizes.sm),
                    ]),

                  // Email
                  if (place.email != null && place.email!.isNotEmpty)
                    Column(children: [
                      Row(
                        children: [
                          Icon(Icons.email),
                          const SizedBox(width: LSizes.spaceBtwItems),
                          Text(
                            place.email!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: LSizes.sm),
                    ]),

                  // Category
                  if (place.category != null && place.category!.isNotEmpty)
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people),
                            const SizedBox(width: LSizes.spaceBtwItems),
                            Text(
                              place.category!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: LSizes.sm),
                      ],
                    ),

                  Divider(),

                  const SizedBox(height: LSizes.sm),

                  // Description
                  Text(
                    place.description.replaceAll(r'\n', '\n'),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: LSizes.spaceBtwSections),

                  // Action Buttons
                  ActionButtons(
                    callActionParameter: place.phoneNumber,
                    mapActionParameter: place.mapCoordinates,
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
