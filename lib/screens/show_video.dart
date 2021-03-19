import 'package:chewie/chewie.dart';
import 'package:dbproject3it1/models/Av_model.dart';
import 'package:dbproject3it1/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'show_List.dart';

class ShowVideo extends StatefulWidget {
  final AvModel avModel;
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ShowVideo(
      {@required this.videoPlayerController,
      this.looping,
      Key key,
      this.avModel})
      : super(key: key);
  @override
  _ShowVideoState createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  AvModel model;
  // VideoPlayerController _controller;
  //VideoPlayerController _controller;
  ChewieController _controller;

  @override
  void initState() {
    super.initState();
    model = widget.avModel;
    _controller = ChewieController(
      videoPlayerController: VideoPlayerController.network(widget.avModel.video)
        ..initialize().then((_) {
          setState(() {});
        }),
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text(model.name == null ? 'Watch Video' : model.name),
      ),
      body: Center(
        child: Chewie(
          controller: _controller,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _controller.dispose();
  }
}

/* @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.avModel.video)
      ..initialize().then((_) {
        setState(() {});
      });
    model = widget.avModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text(model.name == null ? 'Watch Video' : model.name ),
      ),
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : CircularProgressIndicator(),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: MyStyle().darkColor,
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
            FloatingActionButton(
              backgroundColor: MyStyle().darkColor,
              onPressed: () {
                setState(() {
                  _controller.;
                });
              },
              child: Icon(
                _controller.setVolume(true) ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}*/

// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   model = widget.avModel;
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: MyStyle().primaryColor,
//       title: Text(model.name == null ? 'Watch Video' : model.name ),
//     ),
//   );

// Future<void> Controller;
// @override
// void initState() {
//   // TODO: implement initState
//   _controller = VideoPlayerController.network("https://firebasestorage.googleapis.com/v0/b/dbproject3it1-b629d.appspot.com/o/video%2FJav.mp4?alt=media&token=2495b5e3-0a7d-4331-a8cd-86a3ed5ed6ea");
//   Controller = _controller.initialize();
//   _controller.setLooping(true);
//   super.initState();
//   model = widget.avModel;
// }
//
// @override
// void dispose() {
//   super.dispose();
//   _controller.dispose();
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: MyStyle().primaryColor,
//       title: Text(model.name == null ? 'Watch Video' : model.name ),
//     ),
//     body: Stack(
//       children: [
//         FutureBuilder(
//           future: Controller,
//             builder: (context, snapshot) {
//             if(snapshot.connectionState == ConnectionState.active)
//             {
//               return AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             },
//         ),
//         Center(
//           child: ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 if(_controller.value.isPlaying){
//                   _controller.pause();
//                 }else
//                   {
//                     _controller.play();
//                   }
//               });
//             },
//               child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//           ),
//         ),
//       ],
//     ),
//   );
//   }
// }
