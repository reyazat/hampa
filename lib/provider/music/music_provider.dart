import 'dart:io';

import 'package:fitness/models/music_model.dart';
import 'package:fitness/network/app_network.dart';
import 'package:fitness/provider/music/music_state.dart';
import 'package:fitness/services/logger_service.dart';
import 'package:fitness/values/parameters.dart';
import 'package:flutter/foundation.dart';

class MusicProvider with ChangeNotifier, DiagnosticableTreeMixin {

  MusicState _state = MusicInitial();

  // MusicProvider() {
  //   init();
  // }
  List<MusicModel> _musicList = [];
  int _page = 1;
  int totalResults = 0;
  int totalLiked = 6;
  late int currentPage;

  List<MusicModel> get musicList => _musicList;
  int get page => _page;

  set state(MusicState newState) {
    _state = newState;
    notifyListeners();
  }

  MusicState get state => _state;

  void init() async {
    state = MusicLoading();
    await _getMusicList();
  }

  void refresh() async {
    state = MusicLoading();
    _page = 1;
    totalResults = 0;
    totalLiked = 0;
    currentPage = 1;
    _musicList = [];
    await _getMusicList();
  }
  Future<void> loadingPage() async
  {
    _page++;
    await _getMusicList();
  }

  Future<void> _getMusicList() async {
    final Map<String, dynamic> params = {
      "page": _page,
      "length": '10',
    };
    await AppNetwork.getData('${Parameters.hostAPI}music/list', params: params).then((response) async {

      if (response.success == false) {
        state = MusicLoaded();
       // ShowMessageService.showErrorMsg(response.data);

      }else if (response.success == true) {

        totalResults = response.data['total'] ?? 0;
        totalLiked = response.data['liked'] ?? 0;
        currentPage = int.tryParse(response.data['currentPage']) ?? 0;

        response.data['content'].forEach((element) {
          MusicModel musicItem = MusicModel.fromJson(element);
          _musicList.add(musicItem);
        });
        state = MusicLoaded();
      }
    }).catchError((error) {
      state = MusicLoaded();
      LoggerService.logger.e(error);
    });
  }

  Future<void> loadingMusicList() async {
    _page++;
    await _getMusicList();
  }

}
