import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpinKitChasingDots(
            color: Colors.blue,
            size: 50.0,
          ),
          const SizedBox(height: LSizes.spaceBtwItems),
          Text(tr(LocaleKeys.loadingText)),
        ],
      ),
    );
  }
}
