import 'package:flutter/material.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';

class CustomReadonlyFieldWidget extends StatelessWidget {
  const CustomReadonlyFieldWidget({
    required this.labelText,
    required this.value,
    required this.prefixIcon,
    super.key,
  });

  final String labelText;
  final String value;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.spacingMedium,
        vertical: Dimensions.spacingSmall,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        color: Theme.of(context).disabledColor.withValues(alpha: 0.1),
      ),
      child: Row(
        children: [
          Icon(prefixIcon, color: Theme.of(context).hintColor),
          const SizedBox(width: Dimensions.spacingSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelText,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
