import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFPage extends StatefulWidget {
  var path;
  PDFPage({Key? key, required this.path}) : super(key: key);

  @override
  State<PDFPage> createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyAdapt'),
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 104, 200, 161),
      ),
      body: SfPdfViewer.asset(widget.path),
    );
  }
}
