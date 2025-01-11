import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/ui/text_style/custom_text_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:ui' as dart_ui;

import '../../languages/base_language.dart';
import '../../utils/constant.dart';
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
    {Function? onImageDownloadCallback,
    Function? onPdfDownloadCallback,
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
          tooltip: BaseLanguage.toolTip,
        );
      },
      menuChildren: List<MenuItemButton>.generate(
        choices.length,
        (int index) => MenuItemButton(
          onPressed: () async {
            if (index == 0) {
              renderImage(
                  onDownloadImagePath: onImageDownloadCallback,
                  globalKey: globalKey,
                  fileName: fileName);
            } else if (index == 1) {
              renderPdf(
                  globalKey: globalKey,
                  onDownloadPdfPath: onPdfDownloadCallback,
                  fileName: fileName);
            }
          },
          child: Text(
            choices[index],
            style: TextStyle(fontFamily: getFontFamily()),
          ),
        ),
      ),
    ),
  );
}

/// To display tooltip on graph view
Widget tooltipView(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 10),
    ),
  );
}
