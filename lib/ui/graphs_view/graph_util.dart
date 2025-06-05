import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/ui/text_style/custom_text_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:ui' as dart_ui;

import '../../utils/colors_utils.dart';
import '../../utils/constant.dart';
import '../../utils/model/periods_date_range.dart';
import '../../widget_languages/languages.dart';
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
          tooltip: WidgetBaseLanguage.toolTip,
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

Widget getCycleHistoryView(int index, List<PeriodsDateRange> allPeriodRange) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      (index != 0)
          ? Text(
              "${CalenderDateUtils.formatFirstDay(DateTime.parse(allPeriodRange[index].cycleStartDate!))} - ${CalenderDateUtils.formatFirstDay(DateTime.parse(allPeriodRange[index].cycleEndDate!))}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          : Text(
              "${CalenderDateUtils.formatFirstDay(DateTime.parse(allPeriodRange[index].cycleStartDate!))} - ${WidgetBaseLanguage.graphCycleNowTitle}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          height: 25,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemCount: allPeriodRange[index].cycleLength,
              itemBuilder: (BuildContext context, int inx) {
                return Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Container(
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: (inx > allPeriodRange[index].periodDuration!)
                          ? const Color(0x26212121)
                          : defaultMenstruationColor,
                    ),
                  ),
                );
              }),
        ),
      ),
      Text(
        "${allPeriodRange[index].periodDuration!} ${WidgetBaseLanguage.graphCycleDaysPeriod} , ${allPeriodRange[index].cycleLength!} ${WidgetBaseLanguage.graphCycleDaysCycle}",
        style: const TextStyle(color: Color(0xA6212121), fontSize: 10),
      ),
      const SizedBox(
        height: 5,
      ),
    ],
  );
}
