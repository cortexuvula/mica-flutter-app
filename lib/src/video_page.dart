import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
//import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {

  String videoURL;
  String videoTitle;

  VideoPage(
      {Key key,
        this.videoURL,
        this.videoTitle
      }) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {



  VideoPlayerController videoPlayerController;
  ChewieController _chewieController;





  @override
  void initState() {
    super.initState();
    print('https://vimeo.com/${widget.videoURL}');
    videoPlayerController = VideoPlayerController.network(
        'http://neoncortex.net/wp-content/mca/${widget.videoURL}');
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            widget.videoTitle,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setState(() {
//            _controller.value.isPlaying
//                ? _controller.pause()
//                : _controller.play();
//          });
//        },
//        child: Icon(
//          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//        ),
//      ),
    );
  }
}