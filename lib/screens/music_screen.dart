import 'package:fitness/provider/music/music_provider.dart';
import 'package:fitness/provider/music/music_state.dart';
import 'package:fitness/screens/favorite_music.dart';
import 'package:fitness/services/show_message_service.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/list_to_refresh.dart';
import 'package:fitness/widgets/music_item.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen();

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}
class _MusicScreenState extends State<MusicScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MusicProvider>().init();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'آهنگ ها'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Consumer<MusicProvider>(builder: (context, state, child) {
          if (state.state is MusicLoading || state.state is MusicInitial) {
            ShowMessageService.showLoading();
            return const SizedBox();
          } else if (state.state is MusicLoaded) {
            ShowMessageService.closeLoading();
            return Column(
                    children: [
                      RoundedCard(
                        margin: const EdgeInsets.only(bottom: 10),
                        color: MainColors.primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        onTap: () => Get.to(() => const FavoriteMusic()),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:<Widget>[
                                  const Text(
                                    'لیست آهنگ های مورد علاقه',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                                  ),
                                  const SizedBox(height: 5),
                                  state.totalLiked != 0?
                                  Text("${state.totalLiked.toFaString()} آهنگ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 13, color: Colors.white),
                                  ):const SizedBox(),
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: const Icon(Icons.play_circle_outlined, color: Colors.white, size: 35),
                            ),
                          ],
                        ),
                      ),
                      // const ToggleButton(items: ['همه', 'آهنگ های من']),
// const SizedBox(height: 12),
                      Expanded(
                        child: ListToRefresh(
                          onRefresh: context.read<MusicProvider>().refresh,
                          onLoading: context.read<MusicProvider>().loadingPage,
                          totalItems: context.watch<MusicProvider>().totalResults,
                          listCount: context.watch<MusicProvider>().musicList.length,
                          child: context.watch<MusicProvider>().totalResults == 0 ?
                          const Center(child: Text('لیست موسیقی خالی است!'))
                              :ListView.builder(
                            itemCount: state.musicList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return MusicItem(
                                          name: state.musicList[index].name,
                                          duration: state.musicList[index].length,
                                          cover: state.musicList[index].assets['cover'],
                                          favoriteIcon: Icons.favorite_outline,
                                          onTapFavorite: () {},
                                          onTapPlay: () {},
                                        );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
          }else{
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
