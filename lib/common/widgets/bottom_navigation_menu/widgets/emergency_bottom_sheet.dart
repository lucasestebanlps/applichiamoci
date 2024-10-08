import 'package:applichiamoci/common/widgets/bottom_navigation_menu/widgets/emergency_button.dart';
import 'package:applichiamoci/common/widgets/bottom_navigation_menu/widgets/modal_company.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmergencyCallBottomSheet extends StatelessWidget {
  const EmergencyCallBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, // Altura del BottomSheet
      padding: const EdgeInsets.symmetric(
          vertical: LSizes.sm, horizontal: LSizes.md),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text and icon for company button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.emergencyTitle.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: LSizes.md),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(LocaleKeys.companyNumber.tr(),
                  style: Theme.of(context).textTheme.headlineSmall),
              const ModalCompany()
            ]),
            // Company number
            EmergencyServiceButton(
              assetImage: const AssetImage(LImages.pisLogo),
              label: LocaleKeys.companyEmergency.tr(),
              phoneNumber: '800208082', // Número de emergencia de la empresa
              highlightColor: Colors.green, // Color para resaltar el botón
            ),
            const SizedBox(height: LSizes.defaultSpace),

            // Text for other numbers
            Text(LocaleKeys.otherNumbers.tr(),
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            EmergencyServiceButton(
              iconData: Icons.local_hospital,
              label: tr(LocaleKeys.medicalEmergency),
              phoneNumber: '118',
            ),
            const SizedBox(height: LSizes.spaceBtwItems),

            // -- OTHER NUMBERS ---
            EmergencyServiceButton(
              iconData: Icons.security,
              label: tr(LocaleKeys.securityEmergency1),
              phoneNumber: '112',
            ),
            const SizedBox(height: LSizes.spaceBtwItems),
            EmergencyServiceButton(
              iconData: Icons.security,
              label: tr(LocaleKeys.securityEmergency2),
              phoneNumber: '113',
            ),
            const SizedBox(height: LSizes.spaceBtwItems),
            EmergencyServiceButton(
              iconData: Icons.fire_extinguisher,
              label: tr(LocaleKeys.fireEmergency),
              phoneNumber: '115',
            ),
            const SizedBox(height: LSizes.spaceBtwInputFields),
            EmergencyServiceButton(
              label: tr(LocaleKeys.antiViolenceEmergency),
              phoneNumber: '1522',
              iconData: Icons.heart_broken_outlined,
            ),
            const SizedBox(height: LSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
