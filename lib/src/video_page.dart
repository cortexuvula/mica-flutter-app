import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String videoURL;
  final String videoTitle;

  const VideoPage(
      {super.key, required this.videoURL, required this.videoTitle});

  @override
  VideoPageState createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.asset("video/${widget.videoURL}");

    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    await videoPlayerController.initialize();

    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
      );
    });
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
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: Center(
        child: videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
