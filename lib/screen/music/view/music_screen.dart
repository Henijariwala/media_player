import 'package:flutter/material.dart';
import 'package:media_player/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<MusicProvider>().intiAudio();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();

    // MusicModel model = ModalRoute.of(context)!.settings.arguments as MusicModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade300,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.cyan.shade300, Colors.black])),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage("${providerW!.mainList[providerW!.selected][providerW!.selectedSong].image}"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 140,
              ),
              Text(
                "${providerW!.mainList[providerW!.selected][providerW!.selectedSong].name}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                "${providerW!.mainList[providerW!.selected][providerW!.selectedSong].id}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Slider(
                value: providerW!.current.inSeconds.toDouble(),
                onChanged: (value) {
                  providerW!.audioPlayer.seek(Duration(seconds: value.toInt()));
                },
                max: providerW!.song.inSeconds.toDouble(),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${providerW!.current}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "${providerW!.song}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shuffle, color: Colors.white),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        providerR!.audioPlayer.previous();
                        providerR!.durationOfSong();
                        providerR!.changePreview(providerW!.selectedSong);
                      },
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () {
                        providerW!.changePlay();
                      },
                      icon: providerW!.isPlay
                          ? const Icon(
                              Icons.play_circle,
                              color: Colors.white,
                              size: 50,
                            )
                          : const Icon(
                              Icons.pause_circle,
                              color: Colors.white,
                              size: 50,
                            )),
                  IconButton(
                      onPressed: () {
                        providerR!.audioPlayer.next();
                        providerR!.durationOfSong();
                        providerR!.changeImg(providerW!.selectedSong);
                      },
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 50,
                      )),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.repeat,
                      color: Colors.white,
                    ),
              )
            ],
          ),
          ]
        ),
      ),
      )
    );
  }
}
