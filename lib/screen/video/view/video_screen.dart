import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;
  // List<VideoModel> l1 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<VideoProvider>().initVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    // l1 = ModalRoute.of(context)!.settings.arguments as List<VideoModel>;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("${providerW!.videoList[providerW!.videoIndex].title}"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 240,
          width: double.infinity,
          child: Chewie(controller: providerW!.chewieController!),
        ),
      ),
    );
  }
}
