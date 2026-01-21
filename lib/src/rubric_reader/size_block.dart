import 'package:flutter/material.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';

class SizeBlockerWidget extends StatelessWidget {
  final Widget child;
  final double minSize;
  const SizeBlockerWidget({
    super.key,
    required this.child,
    this.minSize = GridSizes.pageSize + RubricSideBar.sideBarSize,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < minSize) {
          return TooSmallWidget();
        } else {
          return child;
        }
      },
    );
  }
}

class TooSmallWidget extends StatelessWidget {
  const TooSmallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(Icons.desktop_access_disabled_rounded, color: Colors.black, size: 80),
              Text("Your window is too small!", style: TextStyle(fontSize: 18, color: Colors.black)),
              Text(
                "Enlarge your window to continue editing your lesson!",
                style: TextStyle(fontSize: 8, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
