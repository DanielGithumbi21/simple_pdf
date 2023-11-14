
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import './pdf_preview_screen.dart';

void main () {
  runApp(MyApp ());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple PDF",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MyHomePage("Simple PDF Generator"),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final String title;
   MyHomePage(this.title);
  final pdf = pw.Document ();
  writeOnPdf () {
    pdf.addPage(pw.MultiPage (
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget> [
          pw.Header(
            level: 0,
            child: pw.Row (
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: <pw.Widget> [
                pw.Text("Githumbi", textScaleFactor: 2)
              ]
            )
          ),
          pw.Header(level: 1,text: "What is Love?"),
          pw.Paragraph(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liberovolutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellusmolestie nunc non blandit massa. Bibendum enim facilisis gravida neque.Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diamvulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortoraliquam nulla facilisi cras fermentum. ',
          ),
        pw.Paragraph(
        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liberovolutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellusmolestie nunc non blandit massa. Bibendum enim facilisis gravida neque.Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diamvulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortoraliquam nulla facilisi cras fermentum. '),
        pw.Header(level: 1, text: 'This is Header'),
        pw.Paragraph(
        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liberovolutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellusmolestie nunc non blandit massa. Bibendum enim facilisis gravida neque.Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diamvulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortoraliquam nulla facilisi cras fermentum. '),
        pw.Paragraph(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liberovolutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellusmolestie nunc non blandit massa. Bibendum enim facilisis gravida neque.Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diamvulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortoraliquam nulla facilisi cras fermentum. '),
          pw.Padding(padding: const pw.EdgeInsets.all(10)),
          pw.Table.fromTextArray(context: context, data: const <List<String>>[
            <String>['Year', 'Sample'],
            <String>['SN0', 'GFG1'],
            <String>['SN1', 'GFG2'],
            <String>['SN2', 'GFG3'],
            <String>['SN3', 'GFG4'],
          ]),
        ];
      }
    ));
  }
  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync( await pdf.save());
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column (
          children: <Widget> [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton (
                child: Text("Preview PDF"),
                style: ButtonStyle(
                    textStyle:
                    MaterialStateProperty.all(const TextStyle(color: Colors.white)),
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () async {
                  writeOnPdf();
                      savePdf();
                  Directory documentDirectory =
                  await getApplicationDocumentsDirectory();

                  String documentPath = documentDirectory.path;

                  String fullPath = "$documentPath/example.pdf";
                  print(fullPath);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PdfPreviewScreen(
                            path:fullPath
                          )));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}