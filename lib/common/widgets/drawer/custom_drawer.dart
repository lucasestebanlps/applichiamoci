import 'package:applichiamoci/common/widgets/l_circular_image.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/features/personalization/controllers/user_controller.dart';
import 'package:applichiamoci/features/screens/chi_siamo/chi_siamo.dart';
import 'package:applichiamoci/features/screens/faq_legale/faq_legale.dart';
import 'package:applichiamoci/features/screens/profile/profile_screen.dart';
import 'package:applichiamoci/translations/locale_keys.g.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:iconsax/iconsax.dart';

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
            return const LShimerEffect(width: 80, height: 150);
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
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(LocaleKeys.selectLanguage.tr()),
          onTap: () {
            LHelperFunctions().showLanguageDialog(context);
          },
        ),
        ListTile(
          leading: const Icon(Iconsax.edit),
          title: const Text(LocaleKeys.editProfile).tr(),
          onTap: () => Get.to(() => const ProfileScreen()),
        ),
        ListTile(
          leading: const Icon(Iconsax.heart),
          title: Text(tr(LocaleKeys.donaOra)),
          onTap: () async {
            bool confirm = await LHelperFunctions().showConfirmationDialog(
              context,
              tr(LocaleKeys.warning),
              tr(LocaleKeys.sitoFondazioneEmanuele),
            );

            if (confirm) {
              LHelperFunctions.urlAction('https://fondazione-emmanuel.org');
            }
          },
        ),
        ListTile(
          leading: const Icon(Iconsax.message_question),
          title: Text('FAQ ${tr(LocaleKeys.legal)}'),
          onTap: () => Get.to(() => FAQScreen()),
        ),
        ListTile(
          leading: const Icon(Iconsax.people),
          title: Text(tr(LocaleKeys.sopraNoi)),
          onTap: () => Get.to(() => const ChiSiamo()),
        ),
        ListTile(
          leading: const Icon(Iconsax.document),
          title: Text(tr(LocaleKeys.termsOfUse)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Iconsax.logout),
          title: Text(tr(LocaleKeys.chiudiSessione)),
          onTap: () => AuthenticationRepository.instance.logout(),
        ),
      ]),
    );
  }
}
