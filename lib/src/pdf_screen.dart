import 'package:flutter/material.dart';
import 'package:flutter_pdf_renderer/flutter_pdf_renderer.dart';

class PDFScreen extends StatefulWidget {
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bedside Cognitive Assessment"),
      ),
      body: Container(
          color: Colors.white,
          child: PdfRenderer(pdfFile: "assets/bca.pdf", width: _width)),
    );
  }
}
