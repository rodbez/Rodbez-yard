import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class SnackBarUtil {
  static void show({required String message, required bool isError}) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: EdgeInsets.zero,
      isDismissible: true,
      duration: const Duration(seconds: 5), // ⏳ Increased duration
      messageText: Align(
        alignment: Alignment.topRight,
        child: Material(
          color: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              color: isError ? RColors.error : RColors.success,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isError ? RColors.error : RColors.success,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: IntrinsicWidth(
              stepWidth: 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    isError ? Icons.error_outline : Icons.check_circle_outline,
                    color: isError ? RColors.white : RColors.black,
                    size: 20,
                  ),
                  const SizedBox(width: RSizes.md),
                  Flexible(
                    child: Text(
                      message,
                      softWrap: true,
                      style: TextStyle(
                        color: isError ? RColors.white : RColors.black,
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(width: RSizes.md),

                  /// 👇 Close icon with dismiss functionality
                  GestureDetector(
                    onTap: () => Get.closeCurrentSnackbar(),
                    child: Icon(
                      Icons.close,
                      color: isError ? RColors.white : RColors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
