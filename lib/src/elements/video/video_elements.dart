import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/video/video_model.dart';
import 'package:rubric/src/elements/video/video_toolbar.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_parser/youtube_parser.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoEditorElement extends StatefulWidget {
  final ElementModel element;
  const VideoEditorElement({super.key, required this.element});

  @override
  State<VideoEditorElement> createState() => VideoEditorElementState();
}

class VideoEditorElementState extends SelectableState<VideoEditorElement> {
  @override
  ElementModel get element => widget.element;

  @override
  onSelect(bool selected) {
    if (selected) {
      editorState.showToolbar(
        widget.element,
        VideoTooltipWidget(element: widget.element),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final properties = widget.element.getProperties<VideoElementModel>();
    if (properties.isYoutube == false) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: FittedBox(
              child: Icon(
            Icons.video_file,
            color: Colors.white,
            size: 50,
          )),
        ),
      );
    } else {
      // return thumbnail
      final youtubeID = getIdFromUrl(properties.videoUrl) ?? "c21QZnQtGqo";
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          "https://img.youtube.com/vi/$youtubeID/sddefault.jpg",
          fit: BoxFit.cover,
        ),
      );
    }
  }
}

class VideoReaderElement extends StatefulWidget {
  final ElementModel element;
  const VideoReaderElement({super.key, required this.element});

  @override
  State<VideoReaderElement> createState() => VideoReaderElementState();
}

class VideoReaderElementState extends State<VideoReaderElement> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;
  YoutubePlayerController? utubeController;

  @override
  void initState() {
    setOrUpdateControllers();
    super.initState();
  }

  Future<void> initializeChewiePlayer(videoUrl) async {
    _videoPlayerController1 =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await _videoPlayerController1.initialize();
    _createChewieController();

    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: false,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      hideControlsTimer: const Duration(seconds: 1),
    );
  }

  setOrUpdateControllers() {
    final properties = widget.element.getProperties<VideoElementModel>();

    if (properties.isYoutube) {
      final youtubeID = getIdFromUrl(properties.videoUrl) ?? "c21QZnQtGqo";
      utubeController ??= YoutubePlayerController(
        params: YoutubePlayerParams(
          mute: false,
          showControls: true,
          showFullscreenButton: true,
        ),
      );
      utubeController!.cueVideoById(videoId: youtubeID);
    } else {
      initializeChewiePlayer(properties.videoUrl);
    }
  }

  @override
  void didUpdateWidget(VideoReaderElement oldWidget) {
    setOrUpdateControllers();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    utubeController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final properties = widget.element.getProperties<VideoElementModel>();
    if (_chewieController case ChewieController controller
        when controller.videoPlayerController.value.isInitialized &&
            properties.isYoutube == false) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(
          controller: controller,
        ),
      );
    }
    if (utubeController case YoutubePlayerController utubeController
        when properties.isYoutube == true) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return YoutubePlayer(
              controller: utubeController,
              aspectRatio: constraints.maxWidth / constraints.maxHeight,
            );
          },
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: SizedBox.expand(
        child: RubricText("Something went wrong"),
      ),
    );
  }
}
