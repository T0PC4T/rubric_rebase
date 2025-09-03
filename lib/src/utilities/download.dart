import 'dart:js_interop';
import 'dart:typed_data';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
import 'package:web/web.dart' as web;

void downloadFile(Uint8List data, String mimeType, String fileName) {
  final jsData = [data.toJS].toJS;
  final blob = web.Blob(jsData, web.BlobPropertyBag(type: mimeType));
  final elem = web.window.document.createElement("a");
  elem.setAttribute("href", web.URL.createObjectURL(blob));
  elem.setAttribute("download", fileName);
  elem as web.HTMLAnchorElement;
  elem.click();
}
