import 'package:flutter/material.dart';
import '../../../../../utils/static_colors.dart';
import '../../../../../widgets/my_custom_text.dart';

class TableAvailabilityHeader extends StatelessWidget {
  const TableAvailabilityHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MyCustomText(
          ' Table Availability',
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 10.0),
        ColorTextRow(
          color: StaticColors.greenColor,
          text: 'Available',
        ),
        ColorTextRow(
          color: StaticColors.yellowColor,
          text: 'Walk-In Booking',
        ),
        ColorTextRow(
          color: StaticColors.orangeColor,
          text: 'Cooking/Serving',
        ),
        ColorTextRow(
          color: StaticColors.blueColor,
          text: 'Online Booking',
        ),
        ColorTextRow(
          color: StaticColors.purpleColor,
          text: 'Combined Tables',
        ),
        ColorTextRow(
          color: StaticColors.pinkColor,
          text: 'Hold Tables',
        ),
      ],
    );
  }
}

class ColorTextRow extends StatelessWidget {
  const ColorTextRow({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: color,
          ),
          const SizedBox(width: 3.0),
          MyCustomText(
            text,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
