import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/custom_inkwell.dart';
import '../../../widgets/my_custom_text.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String description;
  final num amount;
  final num quantity;
  final VoidCallback? onRemove;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;
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
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomLeft,
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    MyCustomText(
                      title,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 2),
                    MyCustomText(
                      description,
                      fontWeight: FontWeight.w600,
                      color: theme.hintColor,
                      fontSize: 14,
                      maxLines: 2,
                    )
                  ],
                ),
              ),
              // btns
              Row(
                children: [
                  CustomInkWell(
                    onTap: onRemove,
                    child: Icon(
                      Icons.delete,
                      color: theme.colorScheme.error,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: OutLineBtn(
                          onPressed: onDecrement!,
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
                        width: 40,
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
                          onPressed: onIncrement!,
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
              const SizedBox(width: 10),
              // amount
              SizedBox(
                width: 70,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "\$$amount",
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: StaticColors.yellowColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
