import 'package:flutter/material.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String description;
  final double amount;
  final int quantity;
  final void Function()? onRemove;
  final void Function()? onDecrement;
  final void Function()? onIncrement;
  const CartItem(
      {super.key,
      required this.title,
      required this.description,
      required this.amount,
      required this.quantity,
      this.onRemove,
      this.onDecrement,
      this.onIncrement});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  // SizedBox(
                  //   height: 36,
                  //   child: OutLineBtn(
                  //     onPressed: onRemove,
                  //     style: theme.textTheme.bodyLarge?.copyWith(
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //     textColor: theme.colorScheme.error,
                  //     padding: const EdgeInsets.only(
                  //         left: 16, right: 16, bottom: 10),
                  //     borderRadius: 4,
                  //     child: const Text(
                  //       "Remove",
                  //     ),
                  //   ),
                  // ),
                  IconButton(
                    onPressed: onRemove,
                    icon: Icon(
                      Icons.delete,
                      color: theme.colorScheme.error,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: OutLineBtn(
                          onPressed: onDecrement,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textColor: theme.hintColor,
                          padding: EdgeInsets.zero,
                          borderRadius: 4,
                          child: const Icon(Icons.remove),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 32,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: theme.hintColor,
                            )),
                        child: Center(
                            child: Text(
                          quantity.toString(),
                          style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.hintColor,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: OutLineBtn(
                          onPressed: onIncrement,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textColor: theme.hintColor,
                          padding: EdgeInsets.zero,
                          borderRadius: 4,
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(width: 30),
              Text(
                "\$$amount",
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: StaticColors.yellowColor,
                ),
              ),
            ],
          ),
          Text(
            description,
            style: theme.textTheme.labelMedium
                ?.copyWith(fontWeight: FontWeight.w700, color: theme.hintColor),
          ),
          const SizedBox(height: 20),
          Divider(
            height: 0,
            color: theme.dividerColor.withOpacity(.3),
          ),
        ],
      ),
    );
  }
}
