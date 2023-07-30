import 'package:fitness/models/cart.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/widgets/counter.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/cupertino.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;

  const CartItem(this.cart);

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Row(
              children: <Widget>[
                Image.asset(cart.thumbImage, width: 100),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cart.title,
                      style: const TextStyle(
                        color: MainColors.grayDarkest,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    if (cart.priceAfterDiscount != null) ...[
                      const SizedBox(height: 5),
                      Text(
                        '${cart.price.toMoney()} تومان',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: MainColors.grayDarkest,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                    const SizedBox(height: 5),
                    Text(
                      cart.priceAfterDiscount != null
                          ? '${cart.priceAfterDiscount?.toMoney()} تومان'
                          : '${cart.price.toMoney()} تومان',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: MainColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Counter(initialValue: cart.quantity),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  CupertinoIcons.trash,
                  color: MainColors.primaryColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
