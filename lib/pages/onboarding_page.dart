import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../exports.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayer;
  ChewieController _chewieController;

  Size get s => MediaQuery.of(context).size;
  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/videos/video.mp4");
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 454.737 / 960,
      autoPlay: true,
      looping: true,
      showControls: false,
      showControlsOnInitialize: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: s.width,
            height: s.height,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                width: s.width,
                height: s.height,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            width: s.width,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Text(
                  "Discover your Nearby Friends",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 54,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -3,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Find your all friends in one place by\nsigning the apps quick & easily,",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: s.width,
                  height: 56,
                  child: FlatButton(
                    onPressed: () {
                      print("Go to Login page");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    color: mainPurple.withOpacity(0.7),
                    child: Text(
                      'Have an account? Login',
                      style: TextStyle(fontSize: 16),
                    ),
                    textColor: textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: s.width,
                  height: 56,
                  child: FlatButton(
                    onPressed: () {
                      print("Go to Register page");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    color: Colors.white.withOpacity(0.7),
                    child: Text(
                      "Join us, it's free",
                      style: TextStyle(fontSize: 16),
                    ),
                    textColor: mainPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
