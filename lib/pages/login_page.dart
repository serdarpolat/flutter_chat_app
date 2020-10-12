import 'dart:ui';

import 'package:chat_app/exports.dart';
import 'package:chat_app/resources/db_helper.dart';
import 'package:chewie/chewie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayer;
  ChewieController _chewieController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DbHelper _dbHelper;

  Size get s => MediaQuery.of(context).size;

  String email = "";
  String password = "";

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
    _dbHelper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        child: Stack(
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
              padding: EdgeInsets.all(40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          width: s.width,
                          child: Text(
                            "Login and\nstart chatting...",
                            style: TextStyle(
                              color: textWhite,
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      validator: (val) {
                        if (val.contains('@') &&
                            val.contains('.') &&
                            val.length > 10) {
                          return null;
                        } else {
                          return "Enter a valid email address, please.";
                        }
                      },
                      onChanged: (val) {
                        email = val;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: textWhite,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(
                          color: textWhite.withOpacity(0.5),
                          fontSize: 18,
                        ),
                        filled: true,
                        fillColor: mainGrey.withOpacity(0.3),
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      validator: (val) {
                        if (val.length > 5) {
                          return null;
                        } else {
                          return "Password must be 6 or more charactersi";
                        }
                      },
                      onChanged: (val) {
                        password = val;
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: textWhite,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(
                          color: textWhite.withOpacity(0.5),
                          fontSize: 18,
                        ),
                        filled: true,
                        fillColor: mainGrey.withOpacity(0.3),
                        hintText: 'Password',
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
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                        textColor: textWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: s.width,
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 36),
                    Container(
                      width: s.width,
                      height: 56,
                      child: FlatButton(
                        onPressed: () async {
                          UserCredential userCredential =
                              await _dbHelper.signInWithGoogle();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Home(uid: userCredential.user.uid)),
                          );
                        },
                        color: Colors.white.withOpacity(0.7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/google.png",
                              width: 24,
                            ),
                            SizedBox(width: 16),
                            Text(
                              "Login with Google",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        textColor: mainPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
