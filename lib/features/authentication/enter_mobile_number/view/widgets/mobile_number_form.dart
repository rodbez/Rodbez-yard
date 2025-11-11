import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodbez_yard/features/authentication/enter_mobile_number/view/widgets/phoneNumberFormatter.dart';
import '../../../../../utils/constants/colors.dart';
import '../../controller/mobile_number_controller.dart';

class MobileNumberInputForm extends StatelessWidget {
  const MobileNumberInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MobileNumberController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(border: Border.all(color: RColors.focusedBorderColor), borderRadius: BorderRadius.circular(12)),
          child: CountryPickerDropdown(
            initialValue: 'IN',
            itemBuilder: controller.buildDropdownItem,
            itemFilter: (c) => c.isoCode == 'IN',
            priorityList: [CountryPickerUtils.getCountryByIsoCode('IN')],
            sortComparator: (a, b) => a.isoCode.compareTo(b.isoCode),
            onValuePicked: (Country country) {
              controller.selectedCountry.value = country;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Obx(() {
            final isValid = controller.isValid.value;
            return TextFormField(
              controller: controller.phoneController,
              focusNode: controller.focusNode,
              maxLength: 13,
              keyboardType: TextInputType.phone,
              inputFormatters: [PhoneNumberFormatter()],
              decoration: InputDecoration(
                hintText: "Mobile number",
                counterText: '',
                suffixIcon: isValid ? const Icon(Icons.check_circle_outline, color: RColors.success) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: isValid ? RColors.success : RColors.focusedBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: isValid ? RColors.success : RColors.focusedBorderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: isValid ? RColors.success : RColors.error),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}