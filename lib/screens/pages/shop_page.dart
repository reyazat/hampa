import 'package:fitness/models/product.dart';
import 'package:fitness/screens/cart_screen.dart';
import 'package:fitness/screens/product_details.dart';
import 'package:fitness/screens/ticket_shop.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/bottom_nav_icon.dart';
import 'package:fitness/widgets/drop_down_menu.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:fitness/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopPage extends StatelessWidget {
  const ShopPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(() => const CartScreen()),
                child: RoundedCard(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Icon(Icons.shopping_cart, color: MainColors.primaryColor),
                      Text(
                        'سبد خرید (1)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: MainColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(() => const TicketShop()),
                child: RoundedCard(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Icon(Icons.confirmation_number_outlined, color: MainColors.primaryColor),
                      Text(
                        'گیشه بلیط',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: MainColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: BottomNavigationIcon(label: 'همه\nمحصولات', icon: Icons.grid_view, isActive: true),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: BottomNavigationIcon(label: 'مواد\nغذایی', icon: Icons.lunch_dining),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: BottomNavigationIcon(label: 'پوشاک\nورزشی', icon: Icons.checkroom),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: BottomNavigationIcon(label: 'لوازم\nورزشی', icon: Icons.fitness_center),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DropDownMenu(
              items: const [
                'جدید ترین',
                'ارزان ترین',
                'گران ترین',
                'پرفروش ترین',
              ],
              onChange: () {},
            ),
            const Text(
              'فیلتر',
              style: TextStyle(color: MainColors.primaryColor, fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              if (index == 0) {
                return ProductItem(
                  product: products[0],
                  onTap: () => Get.to(() => ProductDetails(products[0])),
                );
              }
              return ProductItem(
                product: products[index],
                onTap: () => Get.to(() => ProductDetails(products[index])),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  /// TODO: Remove this after connecting app to REST api
  List<ProductModel> get products {
    final specs = {
      'جنس': 'پارچه',
      'جنس زیره': 'ترموپلاستیک پلی اورتان',
      'کفی': 'قابل تعویض',
      'نحوه بسته شدن': 'بندی',
    };

    return [
      ProductModel(
          title: 'کفش Nike',
          rating: 4.5,
          price: 350000,
          images: ['assets/images/nike.png'],
          specs: specs,
          discount: 10,
          priceAfterDiscount: 150000,
          description:
              'کفش ورزشی محصول شرکت نایکی یک کفش بسیار راحت و بادوام است که راحتی شما را تضمین می کند'),
      ProductModel(
        title: 'مکمل ورزشی',
        rating: 4.5,
        price: 350000,
        images: ['assets/images/powder.png'],
        specs: specs,
      ),
      ProductModel(
        title: 'دمبل',
        rating: 4.5,
        price: 350000,
        images: ['assets/images/dumbbells.png'],
        specs: specs,
      ),
      ProductModel(
        title: 'اسپری بدن',
        rating: 4.5,
        price: 350000,
        images: ['assets/images/spray.png'],
        specs: specs,
      ),
    ];
  }
}
