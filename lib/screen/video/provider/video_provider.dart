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
        video: "https://rr5---sn-gwpa-wb5e.googlevideo.com/videoplayback?expire=1720297829&ei=BVWJZsSBHeyCi9oP_NKDuA8&ip=142.132.137.4&id=o-AHrZPSLolo0m1u1JZXc0KLfUuv2ODLEgXD43wbmUmISZ&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=17733815&ratebypass=yes&dur=235.287&lmt=1717036986666635&c=ANDROID_TESTSUITE&txp=4538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRgIhAM1kjxJSC18wCY4ilD5agRjJtPBHD4PnxmZ6hIL20oitAiEA9oqJjw_T1whw5JhN3CZeoakZQbqb2nihQnPu-3fnDGo%3D&title=Paon%20Ki%20Jutti%20-%20Jyoti%20Nooran%20%7C%20Isha%20Malviya%20%7C%20Shiv%20Panditt%20%7C%20Jaani%20%7C%20Arvvindr%20S%20Khaira%20%7C%20Bunny&redirect_counter=1&rm=sn-4g5ekk7e&fexp=24350518&req_id=7973c0f7e332a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=9I&mip=2409:40c1:302a:f2da:4446:5de3:e433:6ed8&mm=31&mn=sn-gwpa-wb5e&ms=au&mt=1720276151&mv=m&mvi=5&pl=36&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AHlkHjAwRQIgcqXLWaQmuDpJOPE50koWSW7fZYMFb-B-068E8wZpY20CIQD7qVbqrMHbA5QWjtPuZjiLXRaDG-idywkyRa17DieX6g%3D%3D"),
    VideoModel(
      image: "https://c.saavncdn.com/023/Jhamkudi-From-Jhamkudi-Gujarati-2024-20240515213217-500x500.jpg",
      title: "Jhamkudi",
      video: "https://rr7---sn-gwpa-5hql.googlevideo.com/videoplayback?expire=1720296629&ei=VVCJZrTEGY-I6dsPlKy_0AM&ip=148.251.137.140&id=o-AHTPjpnwEQmoZMBx1KQXgNA5orLgp3MIMG7u93dqxYjg&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=12001281&ratebypass=yes&dur=150.093&lmt=1716167650936780&c=ANDROID_TESTSUITE&txp=4538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRAIgI5MR-vjhYDgUWoNE-QgRb9mtQSKWWxWF3UNM7x8Wlx4CIGEweF9waWWx3bxl8HDlM2RuKBlamXSfqg-74qD8VpdT&title=Jhamkudi%20Title%20Song%20%7C%20Manasi%20Parekh%20Gohil%2C%20Viraj%20Ghelani%2C%20Kruz%2C%20K.Deep%20-%20Aghori%20Muzik%20%7C%20New%20Song&redirect_counter=1&rm=sn-4g5eds7z&fexp=24350518&req_id=844d21e59dea3ee&cms_redirect=yes&cmsv=e&hcs=ir&ipbypass=yes&mh=qy&mip=2409:40c1:302a:f2da:4446:5de3:e433:6ed8&mm=31&mn=sn-gwpa-5hql&ms=au&mt=1720276649&mv=m&mvi=7&pl=36&rmhost=rr1---sn-gwpa-5hql.googlevideo.com&lsparams=hcs,ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl,rmhost&lsig=AHlkHjAwRgIhAJJprajM8i8lcUgn-EOhcpQGkCRysnyJKe0yHdHksR9_AiEAz0CsZe1kxSEGknCuJxBi18B83fzuzM1Evf5bxwQH4Q8%3D"
    ),
    VideoModel(
      image: "https://c.saavncdn.com/643/Khokhe-Punjabi-2024-20240520151515-500x500.jpg",
      title: "Khokhe",
      video: "https://rr8---sn-gwpa-civz.googlevideo.com/videoplayback?expire=1720301149&ei=_WGJZrWKIazB6dsP4I2g4AI&ip=144.76.140.134&id=o-AER99cU7-7zpgZ46alEFO_qvxsiiDMxsQVLFZgV3slb3&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=5610426&ratebypass=yes&dur=203.430&lmt=1718152130206078&c=ANDROID_TESTSUITE&txp=5538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRgIhAKxL8PMBseJ65cvvbt9fI_eXg8NozIsNdEWOoaPcwcGpAiEA-iZNzJ5OxJGYnzZ7d9UPPSyBF4hnYyPbzQbMgcgZ0jI%3D&title=Khokhe%20by%20Mankirt%20Aulakh%20%7C%20Simar%20Kaur%20%7C%20Starboy%20X%20%7C%20Ishtar%20Punjabi%20%7C%20Punjabi%20Song%202024&redirect_counter=1&rm=sn-4g5ez77z&fexp=24350518&req_id=c0e22896918ca3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=da&mip=2409:40c1:302a:f2da:4446:5de3:e433:6ed8&mm=31&mn=sn-gwpa-civz&ms=au&mt=1720279282&mv=m&mvi=8&pl=36&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AHlkHjAwRAIgXNjj0NsOBA9vrnTRimistUs0Z9l4MtXAGC2eV8sv3iECIGlqgCnoegXvW2MTXiZz2odONANxQkejp_YDq2IXXoXb"
    ),
    VideoModel(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlmKymYo0LyilAN6VyXVQtnfCC1BT9CNPrcg&s",
      title: "Kassam",
      video: "https://rr3---sn-gwpa-5hqd.googlevideo.com/videoplayback?expire=1720287359&ei=HyyJZo_SFITUi9oP3YqTwAo&ip=142.132.137.4&id=o-AJxKUcfMv6E4H46g2YJ1qXxCsFBtsSeVmTCB7krAlGPH&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=12508688&ratebypass=yes&dur=153.576&lmt=1720253380787553&c=ANDROID_TESTSUITE&txp=3308224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRgIhAMRi668nLsF8vcTaJMSpvgQ1X-tldvCPW6g0wPRUzwVUAiEAkKJMICsQX55wF7YqCCgmRaIKSriqqW81dSgpFbq4laE%3D&title=Kassam%20(Official%20Video)%20Garry%20Sandhu%20%7C%20New%20Punjabi%20Song%202024%20%7C%20Fresh%20Media%20Records&redirect_counter=1&rm=sn-4g5eky7s&fexp=24350518&req_id=b202a23c6574a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=9j&mip=2409:40c1:302a:f2da:4446:5de3:e433:6ed8&mm=31&mn=sn-gwpa-5hqd&ms=au&mt=1720279516&mv=m&mvi=3&pcm2cms=yes&pl=36&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AHlkHjAwRAIgUUt7PjmpyR3FpGLxDEu1V0cdJ4WnfF4MMIBRE2s2toUCIDx_IR9G7bq9NanKkzjbsLoFCtoyGl-eRs3lz0qD0DjH"
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
