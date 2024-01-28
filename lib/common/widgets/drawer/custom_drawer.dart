import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/features/personalization/controllers/user_controller.dart';
import 'package:applichiamoci/features/screens/profile/profile_screen.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/utils/theme/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = LHelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    return Drawer(
      shape: Border.all(
        width: 0, // remove the border
      ),
      child: ListView(padding: EdgeInsets.zero, children: [
        Obx(() {
          if (controller.profileLoading.value) {
            return const LShimerEffect(width: 80, height: 200);
          } else { return
            UserAccountsDrawerHeader(
              // Name
              accountName: Text(
                controller.user.value.fullName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              // Email
              accountEmail: Text(controller.user.value.email,
                  style: Theme.of(context).textTheme.bodyMedium),
              // Account Picture
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(LImages.userImage),
                ),
              ),
              decoration: BoxDecoration(
                color: darkMode ? LColors.dark : LColors.light,
                // can add a bg image to drawer here
                // image: const DecorationImage(image: AssetImage(TImages.onBoardingImage1))
              ),
            );
          }
        }),
        ListTile(
          leading: const Icon(Iconsax.edit),
          title: const Text('Edit profile'),
          onTap: () => Get.to(() => const ProfileScreen()),
        ),
        ListTile(
          leading: const Icon(Iconsax.heart),
          title: const Text('Dona ora'),
          onTap: () async {
            var url = Uri.parse('https://fondazione-emmanuel.org');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              LLoaders.errorSnackBar(
                  title: 'Error', message: 'Non é possibilie andare al sitio');
            }
          },
        ),
        ListTile(
          leading: const Icon(Iconsax.people),
          title: const Text('Sopra noi'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.logout),
          title: const Text('Chiudi sessione'),
          onTap: () => AuthenticationRepository.instance.logout(),
        ),
      ]),
    );
  }
}
