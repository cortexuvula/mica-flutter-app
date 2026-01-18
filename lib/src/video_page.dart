import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:mica/src/widgets/error/error_widgets.dart';

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
  ChewieController? _chewieController;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.asset("video/${widget.videoURL}");

    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      await videoPlayerController.initialize();

      if (!mounted) return;

      setState(() {
        _hasError = false;
        _chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: 3 / 2,
          autoPlay: true,
          looping: true,
        );
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _hasError = true;
        _errorMessage = 'Unable to load video: ${widget.videoURL}';
      });
    }
  }

  void _retryVideoLoad() {
    setState(() {
      _hasError = false;
      _errorMessage = '';
    });

    // Dispose old controller and create new one
    videoPlayerController.dispose();
    _chewieController?.dispose();
    _chewieController = null;

    videoPlayerController =
        VideoPlayerController.asset("video/${widget.videoURL}");
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _chewieController?.dispose();
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
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (_hasError) {
      return ErrorDisplayWidget.videoError(
        message: _errorMessage,
        onRetry: _retryVideoLoad,
      );
    }

    if (videoPlayerController.value.isInitialized && _chewieController != null) {
      return Chewie(controller: _chewieController!);
    }

    return const CircularProgressIndicator();
  }
}
