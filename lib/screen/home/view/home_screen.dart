import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_player/utils/global.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';
import '../../provider/music_provider.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Media Player"),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        SliverToBoxAdapter(
          child: CarouselSlider.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(imgList[index]))),
              );
            },
            options: CarouselOptions(
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                providerW!.changePage(index);
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                imgList.length,
                (index) => Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == providerW!.pageIndex
                              ? Colors.black
                              : Colors.grey),
                    )),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tap to video"
              "",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 210,
            child: ListView.builder(
              itemCount: context.read<VideoProvider>().videoList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<VideoProvider>().changeIndexV(index);
                    Navigator.pushNamed(context, 'video');
                  },
                  child: Expanded(
                    child: Container(
                      height: 300,
                      margin: const EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${context.read<VideoProvider>().videoList[index].image}"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tap to song",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
        SliverGrid.builder(
          itemCount: musicList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                List mainList = [
                  BolloywoodCentral,
                  iPop,
                  Haryanvi,
                  Tollywood,
                  Kollywood,
                  Punjabi
                ];
                context.read<MusicProvider>().changeName(index);
                Navigator.pushNamed(context, "dash",
                    arguments: mainList[index]);
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 230,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${musicList[index].image}"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Text(
                    "${musicList[index].name}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
//Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Media Player"),
//         centerTitle: true,
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.black,
//       ),
//       body: Column(
//         children: [
//           CarouselSlider.builder(
//             itemCount: imgList.length,
//             itemBuilder: (context, index, realIndex) {
//               return Container(
//                 height: 200,
//                 width: MediaQuery.sizeOf(context).width,
//                 decoration: BoxDecoration(
//                     image:
//                         DecorationImage(image: NetworkImage(imgList[index]))),
//               );
//             },
//             options: CarouselOptions(
//               viewportFraction: 0.8,
//               autoPlay: true,
//               autoPlayInterval: const Duration(seconds: 3),
//               enlargeCenterPage: true,
//               onPageChanged: (index, reason) {
//                 providerW!.changePage(index);
//               },
//             ),
//           ),
//           // SmoothPageIndicator(controller: controller, count: imgList.length,
//           //   effect: const SlideEffect(
//           //     dotHeight: 16.0,
//           //     dotWidth: 24.0,
//           //       dotColor:  Colors.grey,
//           //       activeDotColor:  Colors.indigo
//           //   ),
//           //   onDotClicked: (index) {
//           //     providerW!.pageIndex;
//           //   },
//           // ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//                 imgList.length,
//                 (index) => Container(
//                       height: 10,
//                       width: 10,
//                       margin: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: index == providerW!.pageIndex
//                               ? Colors.black
//                               : Colors.grey),
//                     )),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: GridView.builder(
//               itemCount: musicList.length,
//               gridDelegate:
//                   const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//               itemBuilder: (BuildContext context, int index) {
//                 return InkWell(
//                   onTap: () {
//                     List mainList=[
//                       BolloywoodCentral,
//                       iPop,
//                       Haryanvi,
//                       Tollywood,
//                       Kollywood,
//                       Punjabi
//                     ];
//                     context.read<MusicProvider>().changeName(index);
//                     Navigator.pushNamed(context, "dash", arguments: mainList[index]);
//                   },
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 200,
//                           margin: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                image: NetworkImage("${musicList[index].image}"),fit: BoxFit.cover
//                             )
//                           ),
//                         ),
//                       ),
//                       Text("${musicList[index].name}",style: TextStyle(color: Colors.white),)
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
