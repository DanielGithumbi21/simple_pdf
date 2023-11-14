import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfPreviewScreen extends StatelessWidget {
  final path ;
  const PdfPreviewScreen({this.path});
  @override
  Widget build(BuildContext context) {
    return PDFView (
    filePath: path,
    );
  }
}