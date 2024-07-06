import 'package:flutter/material.dart';
import 'package:media_player/screen/dash/view/dash_screen.dart';
import 'package:media_player/screen/home/view/home_screen.dart';
import 'package:media_player/screen/music/view/music_screen.dart';
import 'package:media_player/screen/splash/splash_screen.dart';
import 'package:media_player/screen/video/view/video_screen.dart';

Map<String , WidgetBuilder> app_routes ={
  '/':(context) =>const SplashScreen(),
  'home':(context) =>const HomeScreen(),
  'dash':(context) =>const DashScreen(),
  'music':(context) =>const MusicScreen(),
  'video':(context) =>const VideoScreen(),
};