import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
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
        if (callActionParameter != null && callActionParameter!.isNotEmpty)
          ElevatedButton(
            onPressed: () => LHelperFunctions.callAction(callActionParameter!),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              side: const BorderSide(color: Colors.green),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            ),
            child: Text(
              LTexts.buttonCall,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        if (mapActionParameter != null && mapActionParameter!.isNotEmpty) ...[
          const SizedBox(width: LSizes.spaceBtwItems),
          ElevatedButton(
            onPressed: () => LHelperFunctions.mapAction(mapActionParameter),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            ),
            child: Text(
              LTexts.buttonMap,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ],
    );
  }
}
