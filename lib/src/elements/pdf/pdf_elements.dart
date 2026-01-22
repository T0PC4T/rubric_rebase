// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:internet_file/internet_file.dart';
// import 'package:pdfrx/pdfrx.dart';
// import 'package:rubric/rubric.dart';
// import 'package:rubric/src/elements/base/states.dart';
// import 'package:rubric/src/elements/pdf/pdf_model.dart';
// import 'package:rubric/src/elements/pdf/pdf_toolbar.dart';
// import 'package:rubric/src/models/elements.dart';
// import 'package:rubric/src/rubric_icon/icon_widget.dart';

// class PdfEditorElement extends StatefulWidget {
//   final ElementModel element;
//   const PdfEditorElement({super.key, required this.element});

//   @override
//   State<PdfEditorElement> createState() => PdfEditorElementState();
// }

// class PdfEditorElementState extends FocusableState<PdfEditorElement> {
//   @override
//   ElementModel get element => widget.element;

//   @override
//   onFocus(bool focused) {
//     if (focused) {
//       editorState.showToolbar(widget.element, (element) => PdfTooltipWidget(element: element));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final properties = widget.element.getProperties<PdfElementModel>();
//     const defaultPdfUrl =
//         "https://firebasestorage.googleapis.com/v0/b/academy-5q7q96.firebasestorage.app/o/static%2Fdefault_pdf.pdf?alt=media";
//     final isDefault = properties.pdfUrl == defaultPdfUrl;
//     final theme = RubricEditorStyle.of(context);
//     Widget child;
//     Color backgroundColor;

//     if (isDefault) {
//       backgroundColor = theme.fore4;
//       child = FittedBox(child: RubricIcon(Icons.picture_as_pdf, color: editorState.style.back, size: 50));
//     } else {
//       backgroundColor = theme.theme4;

//       String getFileNameFromUrl(String url) {
//         try {
//           // Firebase storage URLs encode the path in a segment.
//           final path = Uri.parse(url).path;
//           final decodedPath = Uri.decodeComponent(path);
//           final result = decodedPath.split('/').last;
//           final splits = result.split("_");
//           return splits.sublist(2).join("_");
//         } catch (e) {
//           return 'PDF Document'; // Fallback
//         }
//       }

//       final fileName = getFileNameFromUrl(properties.pdfUrl);

//       child = Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           RubricIcon(Icons.picture_as_pdf, color: Colors.white, size: 50),
//           const SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               fileName,
//               style: const TextStyle(color: Colors.white),
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       );
//     }

//     return AspectRatio(
//       aspectRatio: 16 / 12,
//       child: Container(color: backgroundColor, alignment: Alignment.center, child: child),
//     );
//   }
// }

// // Assuming ElementModel and CanvasModel are defined elsewhere in your project
// // import 'path/to/models.dart';

// class PdfReaderElement extends StatefulWidget {
//   final ElementModel element;
//   final CanvasModel canvas;
//   const PdfReaderElement({super.key, required this.element, required this.canvas});

//   @override
//   State<PdfReaderElement> createState() => PdfReaderElementState();
// }

// class PdfReaderElementState extends State<PdfReaderElement> {
//   // 1. Create the controller
//   final PdfViewerController _pdfController = PdfViewerController();

//   Future<Uint8List> _getPdfBytes() async {
//     final properties = widget.element.getProperties<PdfElementModel>();
//     final bytes = await InternetFile.get(properties.pdfUrl);
//     return bytes;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final properties = widget.element.getProperties<PdfElementModel>();

//     return AspectRatio(
//       aspectRatio: 16 / 12,
//       child: Container(
//         color: RubricEditorStyle.of(context).fore,
//         padding: EdgeInsets.all(1),
//         child: FutureBuilder<Uint8List>(
//           future: _getPdfBytes(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return PdfViewer.data(
//                 snapshot.data!,
//                 sourceName: properties.pdfUrl,
//                 // 2. Attach the controller to the viewer
//                 controller: _pdfController,
//                 params: PdfViewerParams(
//                   calculateInitialZoom: (document, controller, fitZoom, coverZoom) {
//                     return coverZoom;
//                   },
//                   boundaryMargin: EdgeInsets.all(0),
//                   margin: 0,
//                   scrollByMouseWheel: 0,
//                   // textSelectionParams: const PdfTextSelectionParams(enabled: false),

//                   // 3. Add the scrollbar using the overlay builder
//                   viewerOverlayBuilder: (context, size, handleLinkTap) => [
//                     PdfViewerScrollThumb(
//                       controller: _pdfController,
//                       orientation: ScrollbarOrientation.right,
//                       thumbSize: Size(15, size.height),
//                       thumbBuilder: (context, thumbSize, pageNumber, controller) =>
//                           Container(decoration: BoxDecoration(color: const Color.fromARGB(94, 62, 62, 62))),
//                     ),
//                     PdfViewerScrollThumb(
//                       controller: _pdfController,
//                       orientation: ScrollbarOrientation.right,
//                       thumbSize: const Size(15, 50),
//                       thumbBuilder: (context, thumbSize, pageNumber, controller) => Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: const Color.fromARGB(255, 57, 57, 57),
//                         ),
//                         child: Center(
//                           child: Text(pageNumber.toString(), style: const TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error loading PDF: ${snapshot.error}'));
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
