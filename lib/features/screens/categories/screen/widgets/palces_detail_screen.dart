import 'package:applichiamoci/utils/helpers/helper_functions.dart';
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

                  // ---- DIRECTION ----

                  if (place.direction != null && place.direction!.isNotEmpty)
                    Column(
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => LHelperFunctions.mapAction(
                                  place.mapCoordinates),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(EdgeInsets.zero),
                                // Aquí también puedes ajustar el margen si es necesario.
                                // Por ejemplo:
                                // margin: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on),
                                  const SizedBox(width: LSizes.spaceBtwItems),
                                  Text(
                                    place.direction!,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  const SizedBox(height: LSizes.sm),

                  // ---- OWNER ----
                  if (place.ownerName != null && place.ownerName!.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: LSizes.spaceBtwItems),
                        Text(
                          place.ownerName!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),

                  // ---- EMAIL ----
                  if (place.email != null && place.email!.isNotEmpty)
                    Row(
                      children: [
                        TextButton(
                          onPressed: () =>
                              LHelperFunctions.emailAction(place.email!),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.zero,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.email,
                                color: Colors.blue, // Color azul para el icono
                              ),
                              const SizedBox(width: LSizes.spaceBtwItems),
                              Text(
                                place.email!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // ---- CATEGORY ----
                  if (place.category != null && place.category!.isNotEmpty)
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.people),
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

                  const Divider(),

                  const SizedBox(height: LSizes.sm),

                  // Description
                  Text(
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
          mapActionParameter: place.mapCoordinates),
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
