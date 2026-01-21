import 'package:flutter/material.dart';
import 'package:rubric/src/models/editor_models.dart';

class PagePadderWidget extends StatelessWidget {
  final Widget child;
  final double? pageWidth;
  final double horizontalEdgePadding;
  final double verticalEdgePadding;
  const PagePadderWidget({
    super.key,
    required this.child,
    this.pageWidth,
    this.horizontalEdgePadding = 25,
    this.verticalEdgePadding = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalEdgePadding, horizontal: horizontalEdgePadding),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: (pageWidth ?? GridSizes.pageSize) + horizontalEdgePadding * 2),
          child: child,
        ),
      ),
    );
  }
}
