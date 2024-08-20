import 'package:flutter/material.dart';
import 'package:touch_down/utils/constants.dart';

class CoachingOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const CoachingOption({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: onChanged,
            checkColor: Colors.white,
            activeColor: AppColor.primaryColor,
            side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(
                color: states.contains(MaterialState.selected) ? AppColor.primaryColor : AppColor.blackColor,
                width: 1.5,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: primaryTextStyle(fontSize: 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
