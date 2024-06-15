import 'package:flutter/material.dart';
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
                      maxLines: 2,
                    ),
                    // const SizedBox(height: 2),
                    // MyCustomText(
                    //   description,
                    //   color: theme.hintColor,
                    //   fontSize: 12,
                    //   maxLines: 2,
                    // )
                  ],
                ),
              ),

              const SizedBox(width: 4),
              // btns
              Row(
                children: [
                  PrimaryBtnWithChild(
                    onPressed: onDecrement!,
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(4),
                    child: const Center(child: Icon(Icons.remove)),
                  ),
                  Container(
                    width: 40,
                    height: 28,
                    decoration: BoxDecoration(
                        border: Border.all(color: theme.hintColor)),
                    child: Center(
                      child: MyCustomText(
                        quantity.toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PrimaryBtnWithChild(
                    onPressed: onIncrement!,
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(4),
                    child: const Center(child: Icon(Icons.add)),
                  ),
                ],
              ),
              const SizedBox(width: 4),
              // amount
              SizedBox(
                width: 70,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "\$${amount.toStringAsFixed(2)}",
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4.0),
              CustomInkWell(
                onTap: onRemove,
                child: Icon(
                  Icons.delete,
                  color: theme.colorScheme.error,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
