import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:applichiamoci/features/screens/services/models/place_model.dart';

class PlaceDetailScreen extends StatelessWidget {
  final PlaceModel place;

  const PlaceDetailScreen({super.key, required this.place});

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
            if (place.image != null && place.image!.isNotEmpty)
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
                        height: 300,
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
                  // ---- TITLE ----
                  Text(
                    place.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: LSizes.sm),
                  // ---- DIRECTION ----
                  if (place.direction != null && place.direction!.isNotEmpty)
                    Column(
                      children: [
                        _buildRow(
                          context,
                          icon: Icons.location_on,
                          text: place.direction!,
                          onTap: () =>
                              LHelperFunctions.mapAction(place.mapCoordinates),
                        ),
                        // ---- OWNER ----
                        if (place.ownerName != null &&
                            place.ownerName!.isNotEmpty)
                          _buildRow(
                            context,
                            icon: Icons.door_front_door_outlined,
                            text: place.ownerName!,
                          ),
                        // ---- EMAIL ----
                        if (place.email != null && place.email!.isNotEmpty)
                          _buildRow(
                            context,
                            icon: Icons.email_outlined,
                            text: place.email!,
                            onTap: () =>
                                LHelperFunctions.emailAction(place.email!),
                          ),
                        // ---- WEBSITE ----
                        if (place.website != null && place.website!.isNotEmpty)
                          _buildRow(
                            context,
                            icon: Icons.last_page_rounded,
                            text: place.website!,
                            onTap: () =>
                                LHelperFunctions.urlAction(place.website!),
                          ),
                      ],
                    ),
                  // ---- CATEGORY ----
                  if (place.category != null && place.category!.isNotEmpty)
                    _buildRow(
                      context,
                      icon: Icons.people,
                      text: place.category!,
                    ),
                  const SizedBox(height: LSizes.sm),
                  // Description
                  Text(
                    softWrap: true,
                    place.description.replaceAll(r'\n', '\n'),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: LSizes.spaceBtwSections),
                  const SizedBox(height: LSizes.spaceBtwSections),
                  const SizedBox(height: LSizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ActionButtons(
        callActionParameter: place.phoneNumber,
        mapActionParameter: place.mapCoordinates,
      ),
    );
  }

  Widget _buildRow(BuildContext context,
      {required IconData icon, required String text, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: LSizes.sm),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: LSizes.spaceBtwItems),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: onTap != null ? Colors.blue : null,
                    ),
              ),
            ),
          ),
        ],
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
