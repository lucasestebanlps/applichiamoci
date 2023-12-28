import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyCallModal extends StatelessWidget {
  const EmergencyCallModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Numeri di emergenza:',
        textAlign: TextAlign.center,
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _EmergencyServiceButton(
            iconData: Icons.local_hospital,
            label: 'Emergenzia Sanitaria',
            phoneNumber: 'tel:118',
          ),
          SizedBox(
            height: LSizes.spaceBtwItems,
          ),
          _EmergencyServiceButton(
            iconData: Icons.security,
            label: 'Emergenzia sicurezza 1',
            phoneNumber: 'tel:112',
          ),
          SizedBox(
            height: LSizes.spaceBtwItems,
          ),
          _EmergencyServiceButton(
            iconData: Icons.security,
            label: 'Emergenzia sicurezza 2',
            phoneNumber: 'tel:113',
          ),
          SizedBox(
            height: LSizes.spaceBtwItems,
          ),
          _EmergencyServiceButton(
            iconData: Icons.fire_extinguisher,
            label: 'Emergenzia incendi',
            phoneNumber: 'tel:115',
          ),
          SizedBox(
            height: LSizes.spaceBtwItems,
          ),
          _EmergencyServiceButton(
            label: 'Emergencia antiviolenza',
            phoneNumber: 'tel:1522',
            iconData: Icons.heart_broken_outlined,
          ),
        ],
        
      ),
       actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
    );
  }
}

class _EmergencyServiceButton extends StatelessWidget {
  final String label;
  final String phoneNumber;
  final IconData iconData;

  const _EmergencyServiceButton({
    required this.label,
    required this.phoneNumber,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          _launchPhoneCall(phoneNumber);
        },
        label: Text(label, textAlign: TextAlign.start,),
        icon: Icon(iconData), // Agregar el icono
      ),
    );
  }

  void _launchPhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Manejar el caso en que no se pueda realizar la llamada
      print('No se pudo realizar la llamada: $phoneNumber');
    }
  }
}
