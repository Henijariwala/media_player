import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../model/video_model.dart';

class VideoProvider
    with ChangeNotifier {
  List<VideoModel> videoList = [
    VideoModel(
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQyB0isbBYuLR_agR8hCSe9prcOrZN575W6Q&s",
        title: "Paon Ki Jutti",
        video: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"),
    VideoModel(
      image: "https://c.saavncdn.com/023/Jhamkudi-From-Jhamkudi-Gujarati-2024-20240515213217-500x500.jpg",
      title: "Jhamkudi",
      video: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    ),
    VideoModel(
      image: "https://c.saavncdn.com/643/Khokhe-Punjabi-2024-20240520151515-500x500.jpg",
      title: "Khokhe",
      video: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"
    ),
    VideoModel(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlmKymYo0LyilAN6VyXVQtnfCC1BT9CNPrcg&s",
      title: "Kassam",
      video: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
    )
  ];

  ChewieController? chewieController;
  int videoIndex = 0;

  void initVideoPlayer() {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse("${videoList[videoIndex].video}"));
    videoPlayerController!.initialize();
    notifyListeners();
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController!);
    notifyListeners();
  }

  void changeIndexV(int i) {
    videoIndex = i;
    initVideoPlayer();
    notifyListeners();
  }
}
