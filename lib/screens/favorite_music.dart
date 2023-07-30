import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/music_item.dart';
import 'package:flutter/material.dart';

class FavoriteMusic extends StatelessWidget {
  const FavoriteMusic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'آهنگ های مورد علاقه'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [

                  for(int i=1; i<=10; i++)
                     MusicItem(
                      name: 'موزیک ورزشی $i',
                      duration: '2:35',
                      favoriteIcon: Icons.favorite,
                       onTapFavorite: () {},
                       onTapPlay: () {},
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
