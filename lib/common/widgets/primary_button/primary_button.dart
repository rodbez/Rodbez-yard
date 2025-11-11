import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class RPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isEnabled;

  const RPrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final states = <WidgetState>{};
    if (!isEnabled) states.add(WidgetState.disabled);

    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size.fromHeight(60)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.disabled)
              ? RColors.disableButtonColor
              : RColors.buttonPrimary,
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.disabled)
              ? RColors.textDarkBlack
              : RColors.textWhite,
        ),
        side: WidgetStateProperty.resolveWith<BorderSide>(
          (states) => BorderSide(
            color: states.contains(WidgetState.disabled)
                ? RColors.disableButtonColor
                : RColors.buttonPrimary,
            width: 1.5,
          ),
        ),
      ),
      child: Text(label),
    );
  }
}
