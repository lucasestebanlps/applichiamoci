import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  // ignore: use_super_parameters
  const ActionButtons({
    Key? key,
    this.callActionParameter,
    this.mapActionParameter,
  }) : super(key: key);

  final String? callActionParameter;
  final String? mapActionParameter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (callActionParameter != null)
          ElevatedButton(
            onPressed: () => LHelperFunctions.callAction(callActionParameter!),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              side: const BorderSide(color: Colors.green),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            ),
            child: const Text('Chiama'),
          ),
        if (mapActionParameter != null) ...[
          const SizedBox(width: LSizes.spaceBtwItems),
          ElevatedButton(
            onPressed: () => LHelperFunctions.mapAction(mapActionParameter),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            ),
            child: const Text('Mappa'),
          ),
        ],
      ],
    );
  }

}


