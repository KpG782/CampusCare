// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'dart:async';

// Define a custom widget named CustomVidPlayer
class CustomVidPlayer extends StatefulWidget {
  CustomVidPlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoPath,
    this.playPauseVideoAction = false,
    this.looping = false,
    this.showControls = false,
    this.allowFullScreen = false,
    this.allowPlayBackSpeedChanging = false,
    this.controlAudio = false,
    this.loadingCircleColor,
    this.enablePlayOnFocus = false,
    this.imageThumbnail,
    this.playbackSpeed,
    this.startTimeSeconds,
    this.actualTimestamp,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoPath;
  bool playPauseVideoAction;
  final bool looping;
  final bool showControls;
  final bool allowFullScreen;
  final bool allowPlayBackSpeedChanging;
  final bool controlAudio;
  final Color? loadingCircleColor;
  final bool enablePlayOnFocus;
  final String? imageThumbnail;
  final double? playbackSpeed;
  final int? startTimeSeconds;
  final Future Function(int timestampSeconds)? actualTimestamp;

  @override
  _CustomVidPlayerState createState() => _CustomVidPlayerState();
}

class _CustomVidPlayerState extends State<CustomVidPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  Timer? _positionTimer;

  void _startPositionTracking() {
    //print('Starting position tracking...'); // Debug print
    _positionTimer?.cancel();

    _positionTimer = Timer.periodic(Duration(milliseconds: 800), (timer) {
      if (_videoPlayerController.value.isInitialized) {
        final currentSeconds = _videoPlayerController.value.position.inSeconds;
        // print('Video position: $currentSeconds seconds'); // Debug print
        widget.actualTimestamp!(currentSeconds);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        if (widget.startTimeSeconds != null && widget.startTimeSeconds! > 0) {
          _videoPlayerController
              .seekTo(Duration(seconds: widget.startTimeSeconds!));
        }

        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: _videoPlayerController.value.aspectRatio,
          looping: widget.looping,
          showControls: widget.showControls,
          allowFullScreen: widget.allowFullScreen,
          allowPlaybackSpeedChanging: widget.allowPlayBackSpeedChanging,
          autoPlay: false,
          materialProgressColors: ChewieProgressColors(
            playedColor: widget.loadingCircleColor ?? Colors.blue,
            handleColor: widget.loadingCircleColor ?? Colors.blue,
          ),
        );

        _startPositionTracking();
        _updateAudioVolume();
        _updatePlaybackSpeed();
      });
  }

  @override
  void didUpdateWidget(CustomVidPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playPauseVideoAction != oldWidget.playPauseVideoAction) {
      if (widget.playPauseVideoAction) {
        _videoPlayerController.play();
        _startPositionTracking();
      } else {
        _videoPlayerController.pause();
        _positionTimer?.cancel();
      }
    }
    if (widget.controlAudio != oldWidget.controlAudio) {
      _updateAudioVolume();
    }
    if (widget.playbackSpeed != oldWidget.playbackSpeed) {
      _updatePlaybackSpeed();
    }
  }

  void _updateAudioVolume() {
    double volume = widget.controlAudio ? 1.0 : 0.0;
    _videoPlayerController.setVolume(volume);
  }

  void _updatePlaybackSpeed() {
    double speed = widget.playbackSpeed ?? 1.0;
    // Limit playback speed between 0.5 and 2.0
    speed = speed.clamp(0.5, 2.0);
    _videoPlayerController.setPlaybackSpeed(speed);
  }

  @override
  void dispose() {
    _positionTimer?.cancel();
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoPath),
      onVisibilityChanged: (visibilityInfo) {
        if (widget.enablePlayOnFocus) {
          if (visibilityInfo.visibleFraction >= 1) {
            if (widget.playPauseVideoAction) {
              _videoPlayerController.play();
            }
          } else {
            _videoPlayerController.pause();
          }
        }
      },
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        child: _videoPlayerController.value.isInitialized
            ? Stack(
                children: [
                  Chewie(controller: _chewieController),
                  if (!widget.showControls)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.playPauseVideoAction =
                              !widget.playPauseVideoAction;
                          if (widget.playPauseVideoAction) {
                            _videoPlayerController.play();
                          } else {
                            _videoPlayerController.pause();
                          }
                        });
                      },
                      behavior: HitTestBehavior.opaque,
                    ),
                ],
              )
            : widget.imageThumbnail != null
                ? Image.network(
                    widget.imageThumbnail!,
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.loadingCircleColor ?? Colors.blue,
                      ),
                    ),
                  ),
      ),
    );
  }
}
