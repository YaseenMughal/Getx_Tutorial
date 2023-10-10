import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

// class VideoPlayerView extends StatefulWidget {
//   const VideoPlayerView({super.key});

//   @override
//   State<VideoPlayerView> createState() => _VideoPlayerViewState();
// }

// class _VideoPlayerViewState extends State<VideoPlayerView> {
//   late CustomVideoPlayerController _customVideoPlayerController;

//   String gymvideopath =
//       "assets/videos/pexels-tima-miroshnichenko-5319759 (2160p).mp4";

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initializeVideoPlayer();
//   }

//   void initializeVideoPlayer() {
//     VideoPlayerController _videoPlayerController;
//     _videoPlayerController = VideoPlayerController.asset(gymvideopath)
//       ..initialize().then((value) {
//         setState(() {});
//       });
//     _customVideoPlayerController = CustomVideoPlayerController(
//         context: context, videoPlayerController: _videoPlayerController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomVideoPlayer(
//           customVideoPlayerController: _customVideoPlayerController),
//     );
//   }
// }

class VideoPlayerView extends StatefulWidget {
  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/videos/pexels-tima-miroshnichenko-5319759 (2160p).mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player Example'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
