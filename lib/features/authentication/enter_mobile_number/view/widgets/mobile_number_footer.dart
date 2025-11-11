import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/primary_button/primary_button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controller/mobile_number_controller.dart';

class MobileNumberFooterBtn extends StatelessWidget {
  const MobileNumberFooterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MobileNumberController.instance;
    return Obx(() => Padding(
        padding: EdgeInsets.only(
          left: RSizes.smallSpace,
          right: RSizes.smallSpace,
          bottom: MediaQuery.of(context).viewInsets.bottom + RSizes.smallSpace,
          top: RSizes.smallSpace,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.isLoading.value
                ? CircularProgressIndicator(color: RColors.yellow,backgroundColor: RColors.white,)
                : RPrimaryButton(
              label: 'Get Verification Code',
              isEnabled: controller.isValid.value,
              onPressed: controller.isValid.value
                  ? () {
                controller.signupWithMobile();
              }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
