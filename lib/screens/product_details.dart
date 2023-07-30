import 'package:fitness/models/product.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/counter.dart';
import 'package:fitness/widgets/custom_rating_bar.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:fitness/utils/num_api.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: product.title),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            /// TODO: Add image carousel
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(product.images[0], height: 200),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
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
                    SizedBox(
                      height: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomRatingBar(product.rating),

                          /// TODO: Comments screen already implemented (see lib/screens/comments_screen.dart)
                          const Text(
                            'مشاهده نظرات',
                            style: TextStyle(
                              color: MainColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Counter(),
                    FilledRoundedButtonSm(label: 'افزودن به سبد خرید'),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: const <Widget>[
                    Icon(Icons.verified_outlined, color: MainColors.primaryColor),
                    SizedBox(width: 5),
                    Text(
                      'مشخصات',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: MainColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                RoundedCard(
                  padding: const EdgeInsets.all(10),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontFamily: 'Shabnam',
                      color: MainColors.grayDarkest,
                      fontSize: 16,
                    ),
                    child: Column(
                      children: <Widget>[
                        for (var entry in product.specs.entries)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(entry.key, style: const TextStyle(fontWeight: FontWeight.w600)),
                              ),
                              Container(color: Colors.white, width: 2, height: 40),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(entry.value),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                if (product.description != null) ...[
                  const SizedBox(height: 40),
                  Row(
                    children: const <Widget>[
                      Icon(Icons.description_outlined, color: MainColors.primaryColor),
                      SizedBox(width: 5),
                      Text(
                        'توضیحات',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: MainColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    product.description!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16, color: MainColors.grayDarkest),
                  ),
                  const SizedBox(height: 30),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
