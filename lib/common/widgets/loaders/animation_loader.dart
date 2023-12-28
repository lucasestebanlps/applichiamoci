
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


// a widget for displaying an animated loading indicator with opional text and action button.
class LAnimationLoaderWidget extends StatelessWidget {
  // default constuctor for the TAnimationLoaderWidget.

  // parameters:
  // - text: the text to be displayed below the animation
  // - animation: the path to the lottie animation file
  // - showAction: whether to show an action button below the text
  // - actionText: the text to be displayed on the action button.
  // - onActionPressed: Callback function to be executed whe the action button is pressed.
  const LAnimationLoaderWidget({
    super.key,
    required this.text, 
    required this.animation, 
    this.showAction = false, 
    this.actionText, 
    this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), // display lottie animation
          const SizedBox(height: LSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: LSizes.defaultSpace),
          showAction
            ? SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: LColors.dark),
                child: Text(
                  actionText!,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: LColors.light),
                ),
              ),
            )
            : const SizedBox()
        ],
      ),
    );
  }
}
