import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:video_player/video_player.dart';

class RubricVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;
  const RubricVideoPlayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        VideoPlayer(controller),
        ControlsOverlay(controller: controller),
        VideoProgressIndicator(
          controller,
          allowScrubbing: true,
          colors: VideoProgressColors(
            playedColor: style.theme,
            bufferedColor: style.theme7,
            backgroundColor: style.fore,
          ),
        ),
      ],
    );
  }
}

class ControlsOverlay extends StatefulWidget {
  const ControlsOverlay({super.key, required this.controller});

  static const List<double> _examplePlaybackRates = <double>[0.5, 1.0, 1.5, 2.0];

  final VideoPlayerController controller;

  @override
  State<ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: widget.controller.value.isPlaying
              ? const SizedBox.shrink()
              : ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(Icons.play_arrow, color: style.back, size: 60.0, semanticLabel: 'Play'),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play();
            });
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: widget.controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              widget.controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in ControlsOverlay._examplePlaybackRates)
                  PopupMenuItem<double>(value: speed, child: Text('${speed}x')),
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${widget.controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
