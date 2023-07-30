import 'package:fitness/models/product.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/widgets/ribbon.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final void Function()? onTap;

  const ProductItem({this.onTap, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        RoundedCard(
          onTap: onTap,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 100),

                    /// TODO: Replace with CachedNetworkImage
                    child: Image.asset(product.images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                product.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: MainColors.grayDarkest,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
              if (product.discount != null && product.priceAfterDiscount != null)
                Text(
                  '${product.price.toMoney()} تومان',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: MainColors.grayDarkest,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              Text(
                product.priceAfterDiscount != null
                    ? '${product.priceAfterDiscount?.toMoney()} تومان'
                    : '${product.price.toMoney()} تومان',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: MainColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        if (product.discount != null && product.priceAfterDiscount != null)
          Ribbon(title: '${product.discount?.toFaString()}٪ تخفیف'),
      ],
    );
  }
}
