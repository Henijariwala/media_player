import 'package:flutter/material.dart';
import 'package:media_player/utils/app_routes.dart';
import 'package:media_player/screen/home/provider/home_provider.dart';
import 'package:media_player/screen/provider/music_provider.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: MusicProvider()),
        ChangeNotifierProvider.value(value: VideoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      ),
    )
  );
}