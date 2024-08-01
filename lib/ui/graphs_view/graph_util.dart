import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:ui' as dart_ui;

import '../../utils/constant.dart';
import '../../utils/strings.dart';
import '../calender_view/calender_date_utils.dart';

/// Generate PDF file
Future<void> renderPdf(
    {Function? onDownloadPdfPath,
    GlobalKey<SfCartesianChartState>? globalKey,
    String? fileName}) async {
  final PdfDocument document = PdfDocument();
  final PdfBitmap bitmap = PdfBitmap(await readImageData(globalKey));

  document.pageSettings.orientation = PdfPageOrientation.portrait;
  document.pageSettings.margins.all = 0;
  document.pageSettings.size =
      Size(bitmap.width.toDouble(), bitmap.height.toDouble());
  final PdfPage page = document.pages.add();
  final Size pageSize = page.getClientSize();
  page.graphics
      .drawImage(bitmap, Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
  final List<int> bytes = document.saveSync();
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  final String path = documentsDirectory.path;
  DateTime currentDatetime = DateTime.now();
  String pdfName =
      '${fileName!}_${CalenderDateUtils.fullDateTime(currentDatetime).toString()}.pdf';
  //printLogs("pdfName $pdfName");
  final File file = File('$path/$pdfName');
  file.writeAsBytesSync(bytes, flush: true);
  document.dispose();
  //printLogs("file path ${file.absolute.path}");
  onDownloadPdfPath!.call(file);
}

/// Read image data
Future<List<int>> readImageData(
    GlobalKey<SfCartesianChartState>? globalKey) async {
  final dart_ui.Image? data =
      await globalKey!.currentState!.toImage(pixelRatio: 3.0);
  final ByteData? bytes =
      await data?.toByteData(format: dart_ui.ImageByteFormat.png);
  return bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
}

/// Generate image
Future<void> renderImage(
    {Function? onDownloadImagePath,
    GlobalKey<SfCartesianChartState>? globalKey,
    String? fileName}) async {
  final List<int> bytes = await readImageData(globalKey);
  await getApplicationDocumentsDirectory();
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  final String path = documentsDirectory.path;
  DateTime currentDatetime = DateTime.now();
  String imageName =
      '${fileName!}_${CalenderDateUtils.fullDateTime(currentDatetime).toString()}.png';
  //printLogs("imageName $imageName");
  imageCache.clear();
  final File file = File('$path/$imageName');
  file.writeAsBytesSync(bytes);
  onDownloadImagePath!.call(file);
}

/// Return option menu widget for graph view
Widget getMenuWidget(
    {Function? onDownloadImagePath,
    Function? onDownloadPdfPath,
    String? fileName,
    GlobalKey<SfCartesianChartState>? globalKey}) {
  return Align(
    alignment: Alignment.topRight,
    child: MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
          tooltip: Strings.toolTip,
        );
      },
      menuChildren: List<MenuItemButton>.generate(
        choices.length,
        (int index) => MenuItemButton(
          onPressed: () async {
            if (index == 0) {
              renderImage(
                  onDownloadImagePath: onDownloadImagePath,
                  globalKey: globalKey,
                  fileName: fileName);
            } else if (index == 1) {
              renderPdf(
                  globalKey: globalKey,
                  onDownloadPdfPath: onDownloadPdfPath,
                  fileName: fileName);
            }
          },
          child: Text(choices[index]),
        ),
      ),
    ),
  );
}
