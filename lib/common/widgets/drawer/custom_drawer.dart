import 'package:applichiamoci/common/widgets/drawer/languaje_selector.dart';
import 'package:applichiamoci/common/widgets/drawer/prueba.dart';
import 'package:applichiamoci/common/widgets/l_circular_image.dart';
import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/features/personalization/controllers/user_controller.dart';
import 'package:applichiamoci/features/screens/profile/profile_screen.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:easy_localization/easy_localization.dart';
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
          } else {
            return UserAccountsDrawerHeader(
              // Name
              accountName: Text(
                controller.user.value.fullName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              // Email
              accountEmail: Text(controller.user.value.email,
                  style: Theme.of(context).textTheme.bodyMedium),
              // Account Picture
              currentAccountPicture: Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image =
                    networkImage.isNotEmpty ? networkImage : LImages.userImage;
                return controller.imageUploading.value
                    ? const LShimerEffect(width: 80, height: 80, radius: 80)
                    : LCircularImage(
                        fit: BoxFit.cover,
                        image: image,
                        width: 100,
                        height: 100,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
              }),
              decoration: BoxDecoration(
                color: darkMode ? LColors.dark : LColors.light,
                // can add a bg image to drawer here
                // image: const DecorationImage(image: AssetImage(TImages.onBoardingImage1))
              ),
            );
          }
        }),
        const LanguageSelectorPrueba(),
        ListTile(
          leading: const Icon(Iconsax.edit),
          title: Text(tr(LTexts.editProfile)),
          onTap: () => Get.to(() => const ProfileScreen()),
        ),
        ListTile(
          leading: const Icon(Iconsax.heart),
          title: Text(tr(LTexts.donaOra)),
          onTap: () async {
            bool confirm = await LHelperFunctions().showConfirmationDialog(
              context,
              tr(LTexts.warning),
              tr(LTexts.sitoFondazioneEmanuele),
            );

            if (confirm) {
              var url = Uri.parse('https://fondazione-emmanuel.org');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                LLoaders.errorSnackBar(
                  title: tr(LTexts.error),
                  message: tr(LTexts.errorNonEpossibile),
                );
              }
            }
          },
        ),
        ListTile(
          leading: const Icon(Iconsax.message_question),
          title: Text('FAQ ${tr(LTexts.legal)}'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.people),
          title: Text(tr(LTexts.sopraNoi)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.document),
          title: Text(tr(LTexts.termsOfUse)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.logout),
          title: Text(tr(LTexts.chiudiSessione)),
          onTap: () => AuthenticationRepository.instance.logout(),
        ),
      ]),
    );
  }
}
