import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/music/model/music_model.dart';

import '../../utils/global.dart';

class MusicProvider with ChangeNotifier {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isPlay = true;
  Duration song = Duration(seconds: 0);
  Duration current = Duration(seconds: 0);
  int selectedSong = 0;
  int selected = 0;

  List<List<MusicModel>> mainList = [
    BolloywoodCentral,
    iPop,
    Haryanvi,
    Tollywood,
    Kollywood,
    Punjabi
  ];

  List<MusicModel> musicModelList = [
    MusicModel(
        "Chandu Champion",
        "Satyanaas",
        "https://pagalfree.com/images/128Tu Hai Champion - Chandu Champion 128 Kbps.jpg",
        "https://pagalfree.com/musics/128-Tu Hai Champion - Chandu Champion 128 Kbps.mp3"),
    MusicModel(
        "Khaali Botal",
        "Khaali Botal",
        "https://pagalfree.com/images/128Khaali Botal - Manan Bhardwaj 128 Kbps.jpg",
        "https://pagalfree.com/musics/128-Khaali Botal - Manan Bhardwaj 128 Kbps.mp3"),
    MusicModel(
        "Rabba Mereya",
        "Rabba Mereya",
        "https://pagalfree.com/images/128Rabba Mereya - B Praak 128 Kbps.jpg",
        "https://pagalfree.com/musics/128-Rabba Mereya - B Praak 128 Kbps.mp3"),
    MusicModel(
        "Heeramandi",
        "Tilasmi Bahein",
        "https://pagalfree.com/images/128Tilasmi Bahein - Heeramandi 128 Kbps.jpg",
        "https://pagalfree.com/musics/128-Tilasmi Bahein - Heeramandi 128 Kbps.mp3"),
    MusicModel(
        "Halki Halki Si",
        "Halki Halki Si",
        "https://pagalfree.com/images/128Halki Halki Si - Asees Kaur 128 Kbps.jpg",
        "https://pagalfree.com/musics/128-Halki Halki Si - Asees Kaur 128 Kbps.mp3")
  ];
  List<NameModel> musicList = [
    NameModel("Bollywood Central",
        "https://www.hindustantimes.com/ht-img/img/2023/12/01/550x309/Animal_1701426538004_1701426544017.jpg"),
    NameModel("I-Pop Superhits",
        "https://i.scdn.co/image/ab67706f00000002d88544263cd0cbc52c1dd656"),
    NameModel("Haryanvi",
        "https://haryanviimage.com/wp-content/uploads/2017/09/Jaat-Brand.jpg"),
    NameModel("Tollywood Pearls",
        "https://i.scdn.co/image/ab67706f00000002dda381d6e4b5ebc246bada8a"),
    NameModel("Kollywood Cream",
        "https://i.scdn.co/image/ab67706f000000021ca2911a6dd95e49bee08d40"),
    NameModel("Punjabi 101",
        "https://i.scdn.co/image/ab67706f000000025c8c8869d7ff2ca5ca51ce82")
  ];

  void changeName(int index) {
    selected = index;
    notifyListeners();
  }

  void changeImg(int index) {
    if (selectedSong < musicModelList.length - 1) {
      selectedSong++;
    } else {
      selectedSong = 0;
    }

    notifyListeners();
  }

  void changePreview(int index) {
    if (selectedSong < musicModelList.length + 1) {
      selectedSong--;
    } else {
      selectedSong = 0;
    }
    notifyListeners();
  }

  void intiAudio() async {

    await audioPlayer.open(
        Playlist(
            startIndex: selectedSong,
            audios: mainList[selected]
                .map(
                  (e) => Audio.network(e.link!),
                )
                .toList()),
        autoStart: false);
    durationOfSong();
    live();
  }

  void changeAudio(int index) {
    selectedSong = index;
    notifyListeners();
  }

  void changePlay() {
    isPlay = !isPlay;
    if (isPlay) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    notifyListeners();
  }

  void durationOfSong() {
    song = audioPlayer.current.value!.audio.duration;
    notifyListeners();
  }

  void live() {
    audioPlayer.currentPosition.listen((event) {
      current = event;
      notifyListeners();
    });
  }
}
