import 'package:flutter/material.dart';
import 'package:media_player/utils/global.dart';
import 'package:media_player/screen/music/model/music_model.dart';
import 'package:provider/provider.dart';

import '../../provider/music_provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  List<MusicModel> l1 = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    l1 = ModalRoute.of(context)!.settings.arguments as List<MusicModel>;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade300,
      ),
      body: Column(
        children: [
          Container(
            height: 270,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.cyan.shade300, Colors.black])),
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "${context.read<MusicProvider>().musicList[context.read<MusicProvider>().selected].image}"),
                          fit: BoxFit.cover)),
                ),
                const Spacer(),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${context.read<MusicProvider>().musicList[context.read<MusicProvider>().selected].name}",
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: l1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    context.read<MusicProvider>().changeAudio(index);
                    Navigator.pushNamed(context, 'music', arguments: l1[index]);
                  },
                  leading: Image.network("${l1[index].image}"),
                  subtitle: Text(
                    "${l1[index].name}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  trailing: Text("${l1[index].id}",style: TextStyle(fontSize: 13),),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
