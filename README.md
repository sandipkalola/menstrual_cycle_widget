# menstrual_cycle_widget

### Overview

**Menstrual Cycle Widget** is a comprehensive and customizable widget designed to help users to show their menstrual cycles seamlessly. It is built with Flutter, allowing easy integration into any Flutter application. This widget provides an intuitive interface, essential features, and insightful visualizations to support users in understanding their menstrual days.

### Features

##### 1) Cycle Tracking:
- Record the start and end dates of menstrual periods.
- Track cycle length and predict future periods and ovulation days.
- Log symptoms other notes. (Upcoming release)

##### 2) Calendar View:
- Monthly view with highlighted period days.
- Display predicted ovulation and fertile windows.
- Option to add periods log.

##### 3) Customization:
- Theme color options to match the app’s style.
- Multiple customization options based on your requirements
- Options to configure cycle length, period duration, user id and other preferences.

##### 4) Privacy & Security:
- Secure data storage with local encryption.

## How to Use

### 1. Installation
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  menstrual_cycle_widget: <latest_version>
```

### 2. Install it

You can install packages from the command line:

```css
$ flutter packages get
```

### 3. Configuration

#### 3.1. Initialization

`MenstrualCycleWidget.init(secretKey: "<Your Secrey Key>", ivKey: "<Your ivKey>");` must be called before using the package:

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Make sure to add the required packages to pubspec.yaml:
  // * https://pub.dev/packages/menstrual_cycle_widget
  MenstrualCycleWidget.init(secretKey: "11a1215l0119a140409p0919", ivKey: "23a1dfr5lyhd9a1404845001");
  runApp(const MyApp());
}
```
#### 3.2. Create a instance of `MenstrualCycleWidget`

A `MenstrualCycleWidget` instance is used to update your configuration as well to access other functions of `MenstrualCycleWidget`
```dart
  final instance = MenstrualCycleWidget.instance!;
```
#### 3.3. Update configuration
Use `updateConfiguration` method to update configuration like
```dart
      instance.updateConfiguration(cycleLength: 28, periodDuration: 5, userId: "1");
```

## Supported Platforms
- [x] iOS
- [x] Android
- [x] Web

## Widget Components
- [x] Menstrual cycle phase view
- [x] Monthly calender view
- [x] Weekly calender view

## 1) Menstrual cycle phase view

```dart
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

class MenstrualCyclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menstrual Cycle Tracker'),
      ),
      body: MenstrualCyclePhaseView(
        size: 300,
        totalCycleDays: 28,
        selectedDay: 4,
        menstruationDayCount: 5,
        follicularDayCount: 7,
        ovulationDayCount: 3,
      ),
    );
  }
}
```
### Required Parameters

| parameters             | Description                                                           |
  |------------------------|-----------------------------------------------------------------------|
| `size`                 | Specifies the overall size of the **MenstrualCyclePhaseView** widget. |
| `totalCycleDays`       | Sets the total number of days in the menstrual cycle.                 |
| `menstruationDayCount` | Defines the number of days for the menstruation phase.                |
| `follicularDayCount`   | Defines the number of days for the follicular phase.                  |
| `ovulationDayCount`    | Defines the number of days for the ovulation phase.                   |

### Optional Parameters


| parameters                     | Description                                                                                                                                                                                                                                                                                                      |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `imgSize`                      | Specifies the size of the image in the central circle. Default is **30**.                                                                                                                                                                                                                                        |
| `imageAssets`                  | Sets the image to be displayed inside the central circle.                                                                                                                                                                                                                                                        |
| `centralCircleBackgroundColor` | Sets the background color of the central circle. Default is **'Color(0xffed9dba)'**. <br> **NOTE**: Only when viewType is **MenstrualCycleViewType.circleImage** or **MenstrualCycleViewType.circleText**                                                                                                        |
| `centralCircleSize`            | Specifies the size of the central circle. Default is **25**.  <br>**NOTE**: Only when viewType is **MenstrualCycleViewType.circleImage** or **MenstrualCycleViewType.circleText**                                                                                                                                |
| `dayFontSize`                  | Specifies the font size of the day numbers (1, 2, 3, etc.). Default is **12**.                                                                                                                                                                                                                                   |
| `dayTextColor`                 | Specifies the font size of the day numbers (1, 2, 3, etc.). Default is **12**.                                                                                                                                                                                                                                   |
| `dayTitleFontSize`             | Specifies the font size of the 'Day' title text. Default is **5**.                                                                                                                                                                                                                                               |
| `isShowDayTitle`               | Controls the visibility of the 'Day' title. Set to false to hide it. Default is **true**.                                                                                                                                                                                                                        |
| `menstruationBackgroundColor`  | Sets the background color for the menstruation phase. Default is **'Color(0x26ff584f)'**.                                                                                                                                                                                                                        |
| `menstruationColor`            | Sets the color for the menstruation phase. Default is **'Color(0xFFff584f)'**.                                                                                                                                                                                                                                   |
| `menstruationDayTextColor`     | Specifies the text color of the menstruation day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.                                                                                                                                                                                                         |
| `menstruationName`             | Specifies the menstruation phase name. Default is **'Menstruation'**.                                                                                                                                                                                                                                            |
| `menstruationTextColor`        | Specifies the text color of menstruation phase name. Default is **'Color(0xFFff584f)'**.                                                                                                                                                                                                                         |
| `follicularBackgroundColor`    | Sets the background color for the follicular phase. Default is **'Color(0x26eec9b7)'**.                                                                                                                                                                                                                          |
| `follicularPhaseColor`         | Sets the color for the follicular phase. Default is **'Color(0xFFeec9b7)'**.                                                                                                                                                                                                                                     |
| `follicularPhaseDayTextColor`  | Specifies the text color of the follicular day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.                                                                                                                                                                                                           |
| `follicularPhaseName`          | Specifies the follicular phase name. Default is **'Follicular phase'**.                                                                                                                                                                                                                                          |
| `follicularTextColor`          | Specifies the text color of follicular phase name. Default is **'Color(0xFFeec9b7)'**.                                                                                                                                                                                                                           |
| `ovulationBackgroundColor`     | Sets the background color for the ovulation phase. Default is **'Color(0x2622bc79)'**.                                                                                                                                                                                                                           |
| `ovulationColor`               | Sets the color for the ovulation phase. Default is **'Color(0xFF22bc79)'**.                                                                                                                                                                                                                                      |
| `ovulationDayTextColor`        | Specifies the text color of the ovulation day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.                                                                                                                                                                                                            |
| `ovulationName`                | Specifies the ovulation phase name. Default is **'Ovulation'**.                                                                                                                                                                                                                                                  |
| `ovulationTextColor`           | Specifies the text color of ovulation phase name. Default is **'Color(0xFF22bc79)'**.                                                                                                                                                                                                                            |
| `lutealPhaseBackgroundColor`   | Sets the background color for the luteal phase. Default is **'Color(0x26abcdf0)'**.                                                                                                                                                                                                                              |
| `lutealPhaseColor`             | Sets the color for the luteal phase. Default is **'Color(0xFFabcdf0)'**.                                                                                                                                                                                                                                         |
| `lutealPhaseDayTextColor`      | Specifies the text color of the luteal day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.                                                                                                                                                                                                               |
| `lutealPhaseName`              | Specifies the follicular phase name. Default is **'Luteal phase'**.                                                                                                                                                                                                                                              |
| `lutealPhaseTextColor`         | Specifies the text color of follicular phase name. Default is **'Color(0xFFabcdf0)'**.                                                                                                                                                                                                                           |
| `phasesTextSize`               | Specifies font size of the phase days ('Menstruation', 'Follicular phase', 'Ovulation' and 'Luteal phase'). Default is 8.                                                                                                                                                                                        |
| `selectedDay`                  | Specifies the current day of **'Menstrual Cycle Phase'**.                                                                                                                                                                                                                                                        |
| `selectedDayBackgroundColor`   | Specifies the circle background of selected day. Default is **white**.                                                                                                                                                                                                                                           |
| `selectedDayCircleBorderColor` | Specifies the circle border color of selected day. Default is based on selected day's background color.                                                                                                                                                                                                          |
| `selectedDayCircleSize`        | Specifies the circle size of selected day. Default is **18**.                                                                                                                                                                                                                                                    |
| `selectedDayTextColor`         | Specifies the text color of the selected day. Default is **'Colors.black'**.                                                                                                                                                                                                                                     |
| `selectedDayFontSize`          | Specifies the font size of the selected day.                                                                                                                                                                                                                                                                     |
| `dayFontWeight`                | Specifies the font weight of the day. Default is **FontWeight.normal**                                                                                                                                                                                                                                           |
| `circleDaySize`                | Specifies the size of the circle. NOTE: Only when Theme is MenstrualCycleTheme.circle                                                                                                                                                                                                                            |
| `theme`                        | Specifies the theme of your menstrual widget . Default is **'MenstrualCycleTheme.basic'**                                                                                                                                                                                                                        |
| `phaseTextBoundaries`          | Specifies where you have to show phase text ('Menstruation', 'Follicular phase', 'Ovulation' and 'Luteal phase'). Either is **Inside circle (PhaseTextBoundaries.inside)**, **Outside circle (PhaseTextBoundaries.outside)** or **Both (PhaseTextBoundaries.both)**. Default is **'PhaseTextBoundaries.inside'** |
| `arcStrokeWidth`               | Specifies the size of the arc Stroke. Default is **30**. NOTE: Only when Theme is MenstrualCycleTheme.circle                                                                                                                                                                                                     |
| `outsidePhasesTextSize`        | Specifies the font size of outside phase text. Default is **12**                                                                                                                                                                                                                                                 |
| `outsideTextCharSpace`         | Specifies the text character spaces of outside phase text. Default is **3**                                                                                                                                                                                                                                      |
| `outsideTextSpaceFromArc`      | Specifies the space between Arc circle and phase text. Default is **30**                                                                                                                                                                                                                                         |
| `centralCircleBorderColor`     | Specifies the  color of the central circle border. Default is **'Colors.transparent'**. **NOTE**: Only when viewType is **MenstrualCycleViewType.circleImage** or **MenstrualCycleViewType.circleText**                                                                                                          |
| `centralCircleBorderSize`      | Specifies the size of the central circle border.  Default is **1**. **NOTE**: Only when viewType is **MenstrualCycleViewType.circleImage** or **MenstrualCycleViewType.circleText**                                                                                                                              |
| `isRemoveBackgroundPhaseColor` | Set as **true** if you want want background color of phase.                                                                                                                                                                                                                                                      |
| `viewType`                     | Specifies view of your **Menstrual Cycle Widget**.  Default is **MenstrualCycleViewType.none**.                                                                                                                                                                                                                  |
| `title`                        | Specifies the title text of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                                          |
| `titleTextColor`               | Specifies the title text color of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                                    |
| `titleTextSize`                | Specifies the title text size of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                                     |
| `titleFontWeight`              | Specifies the title font weight of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                                   |
| `message`                      | Specifies the message text of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                                        |
| `messageTextColor`             | Specifies the message text color of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                                  |
| `messageTextSize`              | Specifies the message text size of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                                   |
| `messageFontWeight`            | Specifies the message font weight of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                                 |
| `spaceBtnTitleMessage`         | Specifies the space between title & message of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                                                       |

### Theme example

| **MenstrualCycleTheme.basic**                                                                                                   | **MenstrualCycleTheme.arcs**                                                                                                   | **MenstrualCycleTheme.circle**                                                                                                    |
|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/basic.jpg?raw=true" height = "200px"> | <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/arcs.jpg?raw=true" height = "200px"> | <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/circle.jpg?raw=true"  height = "200px"> |

### Phase text boundaries example

| Example                                                                                                                                                                                                                                                                                                                                                                                                                      |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **PhaseTextBoundaries.inside**                                                                                                                                                                                                                                                                                                                                                                                               |
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/arcs.jpg?raw=true"  height = "200px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/basic.jpg?raw=true"  height = "200px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/circle.jpg?raw=true"  height = "200px">                           |
| **PhaseTextBoundaries.outside**                                                                                                                                                                                                                                                                                                                                                                                              |
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/arc_outside.jpeg?raw=true"  height = "200px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/basic_outside.jpeg?raw=true"  height = "200px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/circle_outside.jpeg?raw=true"  height = "200px"> |
| **PhaseTextBoundaries.both**                                                                                                                                                                                                                                                                                                                                                                                                 |
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/arc_both.jpeg?raw=true"  height = "200px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/basic_both.jpeg?raw=true"  height = "200px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/circle_both.jpeg?raw=true"  height = "200px">          |

### viewType example

| **MenstrualCycleViewType.circleImage**                                                                                                                | **MenstrualCycleViewType.image**                                                                                                                      | 
|-------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/menstrual_cycle_view_type1.png?raw=true"  height = "200px"> | <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/menstrual_cycle_view_type2.png?raw=true"  height = "200px"> |
| **MenstrualCycleViewType.text**                                                                                                                       | **MenstrualCycleViewType.circleText**                                                                                                                 | 
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/menstrual_cycle_view_type3.png?raw=true"  height = "200px"> | <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/menstrual_cycle_view_type4.png?raw=true"  height = "200px"> |


## 2) Monthly calender view

```dart
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

class CalenderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Calender View'),
      ),
      body: MenstrualCycleMonthlyCalenderView(
        themeColor: "000000",
        hideInfoView: false,
        daySelectedColor: Colors.blue,
        onDataChanged: (value) {},
      ),
    );
  }
}
```
### Parameters

| parameters         | Description                                                                            |
|--------------------|----------------------------------------------------------------------------------------|
| `themeColor`       | Specifies the theme color to match the app’s style                                     |
| `daySelectedColor` | Specifies the selected day color.                                                      |
| `hideInfoView`     | Set true to hide information view. Default is false                                    |
| `onDataChanged`    | Callback this function if change any data into calender view.                          |
| `isShowCloseIcon`    | Set true to show (X) close icon on top left side of calender view. Default is false  . |


### Example

| Example                                                                                                                                                                                                                                                                       |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/month_view.jpeg?raw=true"  height = "600px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/month_edit.jpeg?raw=true"  height = "600px"> |


## 3) Weekly calender view

```dart
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

class CalenderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calender View'),
      ),
      body: MenstrualCycleCalenderView(
        themeColor: "000000",
        daySelectedColor: Colors.blue,
        logPeriodText: "Log Period",
        backgroundColorCode: "FFFFFF",
        hideInfoView: false,
        onDateSelected: (date) {},
        onDataChanged: (value) {},
        hideBottomBar: false,
        hideLogPeriodButton: false,
        isExpanded: false,
      ),
    );
  }
}
```
### Parameters

| parameters            | Description                                                               |
|-----------------------|---------------------------------------------------------------------------|
| `themeColor`          | Specifies the theme color to match the app’s style                        |
| `daySelectedColor`    | Specifies the selected day color.                                         |
| `hideInfoView`        | Set true to hide information view. Default is false                       |
| `onDataChanged`       | Callback this function if change any data into calender view.             |
| `logPeriodText`       | Specifies text of your log period button.                                 |
| `backgroundColorCode` | Specifies the backgound color of your calender view to match app's style. |
| `hideBottomBar`       | Set true to hide bottom view of calender.                                 |
| `hideLogPeriodButton` | Set true to hide log period button from calender.                         |
| `isExpanded`          | Set true to show monthly style calender view.                             |
| `onDateSelected`      | Callback this function if tap on any date.                                |


### Example

| Example                                                                                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/week.jpeg?raw=true"  height = "300px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/weeklyfull.jpeg?raw=true"  height = "300px"> |


> **Note**: Default cycle length is 28 days. Default period duration is 5 days.

## Bugs or Requests

If you encounter any problems feel free to open an [issue](https://github.com/sandipkalola/menstrual_cycle_widget/issues/new?template=bug_report.md). If you feel the library is missing a feature, please raise a [ticket](https://github.com/sandipkalola/menstrual_cycle_widget/issues/new?template=feature_request.md) on GitHub.


## Github example link
https://github.com/sandipkalola/menstrual_cycle_widget_example

## Donate
> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> - [PayPal](https://paypal.me/sandipkalola)
> - [GitHub Sponsors](https://github.com/sponsors/sandipkalola)
