import 'package:flutter/material.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';

extension OverlayExtensions on BuildContext {
  void showSnackBar(String message, {bool isError = true}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isError ? Icons.cancel : Icons.check_circle,
                    size: 22,
                    color: Theme.of(this).primaryColor,
                  ),
                  SizedBox(width: isError ? 10 : Dimensions.spacingDefault),

                  Flexible(
                    child: Text(
                      message,
                      style: robotoRegular.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: Dimensions.spacingDefault,
            vertical: Dimensions.spacingSmall,
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.transparent,
          elevation: 0,
          clipBehavior: Clip.none,
        ),
      );
  }
}
