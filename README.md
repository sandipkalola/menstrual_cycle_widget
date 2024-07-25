# menstrual_cycle_widget

### Overview

**Menstrual Cycle Widget** is a comprehensive and customizable widget designed to help users to show their menstrual cycles seamlessly. It is built with Flutter, allowing easy integration into any Flutter application. This widget provides an intuitive interface, essential features, and insightful visualizations to support users in understanding their menstrual days.

#### Note
> - **Menstrual Cycle Widget** widget is not a diagnostic tool.
> - Default cycle length is 28 days. Default period duration is 5 days.


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
      instance.updateConfiguration(cycleLength: 28, periodDuration: 5, customerId: "1");
```
###  Parameters

| Parameters        | Datatype | Description                                                                    | Default Value |
|-------------------|----------|--------------------------------------------------------------------------------|---------------|
| `cycleLength`*    | int      | Required. Specifies the total number of cycle days in the menstrual cycle      | -             |
| `periodDuration`* | int      | Required. Specifies the total number of period duration in the menstrual cycle | -             |
| `customerId`      | String   | Specifies the user id to store data.                                           | 0(Zero)       |
| `lastPeriodDate`  | DateTime | Specifies the last period date.                                                | Null          |


## Supported Platforms
- [x] iOS
- [x] Android

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
        theme: MenstrualCycleTheme.arcs,
        phaseTextBoundaries: PhaseTextBoundaries.outside,
        isRemoveBackgroundPhaseColor: true,
        viewType: MenstrualCycleViewType.text,
        isAutoSetData: true,
      ),
    );
  }
}
```
### Required Parameters

| Parameters | Datatype | Description                                                           | Default Value |
|------------|----------|-----------------------------------------------------------------------|---------------|
| `size`     | int      | Specifies the overall size of the **MenstrualCyclePhaseView** widget. | -             |


### Optional Parameters


| Parameters                     | Datatype               | Description                                                                                                                                                                                                                                                          | Default Value               |
|--------------------------------|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|
| `isAutoSetData`                | bool                   | Sets true to get data automatically from calender view.                                                                                                                                                                                                              | false                       |
| `totalCycleDays`               | int                    | Specifies the total number of cycle days in the menstrual cycle.                                                                                                                                                                                                     | 28                          |
| `menstruationDayCount`         | int                    | Defines the number of days for the menstruation phase.                                                                                                                                                                                                               | 5                           |
| `follicularDayCount`           | int                    | Defines the number of days for the follicular phase.                                                                                                                                                                                                                 | 6                           |
| `ovulationDayCount`            | int                    | Defines the number of days for the ovulation phase.                                                                                                                                                                                                                  | 5                           |
| `imgSize`                      | double                 | Specifies the size of the image in the central circle.                                                                                                                                                                                                               | 30                          |
| `imageAssets`                  | String                 | Sets the image to be displayed inside the central circle.                                                                                                                                                                                                            | Null                        |
| `centralCircleBackgroundColor` | Color                  | Sets the background color of the central circle.  <br> **NOTE**: Only when viewType is **MenstrualCycleViewType.circleImage** or **MenstrualCycleViewType.circleText**                                                                                               | Colors.transparent          |
| `centralCircleSize`            | double                 | Specifies the size of the central circle.  <br>**NOTE**: Only when viewType is **MenstrualCycleViewType.circleImage** or **MenstrualCycleViewType.circleText**                                                                                                       | 25                          |
| `dayFontSize`                  | double                 | Specifies the font size of the day numbers (1, 2, 3, etc.).                                                                                                                                                                                                          | 12                          |
| `dayTextColor`                 | Color                  | Specifies the font color of dat text.                                                                                                                                                                                                                                | Colors.black                |
| `dayTitleFontSize`             | double                 | Specifies the font size of the 'Day' title text.                                                                                                                                                                                                                     | 12                          |
| `isShowDayTitle`               | bool                   | Controls the visibility of the 'Day' title. Set to false to hide it.                                                                                                                                                                                                 | true                        |
| `menstruationBackgroundColor`  | Color                  | Sets the background color for the menstruation phase.                                                                                                                                                                                                                | Color(0x26ff584f)           |
| `menstruationColor`            | Color                  | Sets the color for the menstruation phase.                                                                                                                                                                                                                           | Color(0xFFff584f)           |
| `menstruationDayTextColor`     | Color                  | Specifies the text color of the menstruation day numbers (1, 2, 3, etc.).                                                                                                                                                                                            | Colors.black                |
| `menstruationName`             | String                 | Specifies the menstruation phase name.                                                                                                                                                                                                                               | Menstruation                |
| `menstruationTextColor`        | Color                  | Specifies the text color of menstruation phase name.                                                                                                                                                                                                                 | Color(0xFFff584f)           |
| `follicularBackgroundColor`    | Color                  | Sets the background color for the follicular phase.                                                                                                                                                                                                                  | Color(0x26eec9b7)           |
| `follicularPhaseColor`         | Color                  | Sets the color for the follicular phase.                                                                                                                                                                                                                             | Color(0xFFeec9b7)           |
| `follicularPhaseDayTextColor`  | Color                  | Specifies the text color of the follicular day numbers (1, 2, 3, etc.).                                                                                                                                                                                              | Colors.black                |
| `follicularPhaseName`          | String                 | Specifies the follicular phase name.                                                                                                                                                                                                                                 | Follicular phase            |
| `follicularTextColor`          | Color                  | Specifies the text color of follicular phase name.                                                                                                                                                                                                                   | Color(0xFFeec9b7)           |
| `ovulationBackgroundColor`     | Color                  | Sets the background color for the ovulation phase.                                                                                                                                                                                                                   | Color(0x2622bc79)           |
| `ovulationColor`               | Color                  | Sets the color for the ovulation phase.                                                                                                                                                                                                                              | Color(0xFF22bc79)           |
| `ovulationDayTextColor`        | Color                  | Specifies the text color of the ovulation day numbers (1, 2, 3, etc.).                                                                                                                                                                                               | Colors.black                |
| `ovulationName`                | String                 | Specifies the ovulation phase name.                                                                                                                                                                                                                                  | Ovulation                   |
| `ovulationTextColor`           | Color                  | Specifies the text color of ovulation phase name.                                                                                                                                                                                                                    | Color(0xFF22bc79)           |
| `lutealPhaseBackgroundColor`   | Color                  | Sets the background color for the luteal phase.                                                                                                                                                                                                                      | Color(0x26abcdf0)           |
| `lutealPhaseColor`             | Color                  | Sets the color for the luteal phase.                                                                                                                                                                                                                                 | Color(0xFFabcdf0)           |
| `lutealPhaseDayTextColor`      | Color                  | Specifies the text color of the luteal day numbers (1, 2, 3, etc.).                                                                                                                                                                                                  | Colors.black                |
| `lutealPhaseName`              | String                 | Specifies the follicular phase name.                                                                                                                                                                                                                                 | Luteal phase                |
| `lutealPhaseTextColor`         | Color                  | Specifies the text color of follicular phase name.                                                                                                                                                                                                                   | Color(0xFFabcdf0)           |
| `phasesTextSize`               | double                 | Specifies font size of the phase days ('Menstruation', 'Follicular phase', 'Ovulation' and 'Luteal phase').                                                                                                                                                          | 8                           |
| `selectedDay`                  | int                    | Specifies the current day of **'Menstrual Cycle Phase'**.                                                                                                                                                                                                            | -                           |
| `selectedDayBackgroundColor`   | Color                  | Specifies the circle background of selected day.                                                                                                                                                                                                                     | white                       |
| `selectedDayCircleBorderColor` | Color                  | Specifies the circle border color of selected day. Default is based on selected day's background color.                                                                                                                                                              | -                           |
| `selectedDayCircleSize`        | double                 | Specifies the circle size of selected day.                                                                                                                                                                                                                           | 18                          |
| `selectedDayTextColor`         | Color                  | Specifies the text color of the selected day.                                                                                                                                                                                                                        | Colors.black                |
| `selectedDayFontSize`          | double                 | Specifies the font size of the selected day.                                                                                                                                                                                                                         | 12                          |
| `dayFontWeight`                | FontWeight             | Specifies the font weight of the day.                                                                                                                                                                                                                                | FontWeight.normal           |
| `circleDaySize`                | double                 | Specifies the size of the circle. NOTE: Only when Theme is MenstrualCycleTheme.circle                                                                                                                                                                                | -                           |
| `theme`                        | MenstrualCycleTheme    | Specifies the theme of your menstrual widget .                                                                                                                                                                                                                       | MenstrualCycleTheme.basic   |
| `phaseTextBoundaries`          | PhaseTextBoundaries    | Specifies where you have to show phase text ('Menstruation', 'Follicular phase', 'Ovulation' and 'Luteal phase'). Either is **Inside circle (PhaseTextBoundaries.inside)**, **Outside circle (PhaseTextBoundaries.outside)** or **Both (PhaseTextBoundaries.both)**. | PhaseTextBoundaries.inside  |
| `arcStrokeWidth`               | double                 | Specifies the size of the arc Stroke. NOTE: Only when Theme is MenstrualCycleTheme.circle                                                                                                                                                                            | 30                          |
| `outsidePhasesTextSize`        | double                 | Specifies the font size of outside phase text.                                                                                                                                                                                                                       | 12                          |
| `outsideTextCharSpace`         | int                    | Specifies the text character spaces of outside phase text.                                                                                                                                                                                                           | 3                           |
| `outsideTextSpaceFromArc`      | int                    | Specifies the space between Arc circle and phase text.                                                                                                                                                                                                               | 30                          |
| `centralCircleBorderColor`     | Color                  | Specifies the  color of the central circle border. **NOTE**: Only when viewType is **MenstrualCycleViewType.circleImage** or **MenstrualCycleViewType.circleText**                                                                                                   | Colors.transparent          |
| `centralCircleBorderSize`      | int                    | Specifies the size of the central circle border. **NOTE**: Only when viewType is **MenstrualCycleViewType.circleImage** or **MenstrualCycleViewType.circleText**                                                                                                     | 1                           |
| `isRemoveBackgroundPhaseColor` | bool                   | Set as **true** if you want want background color of phase.                                                                                                                                                                                                          | -                           |
| `viewType`                     | MenstrualCycleViewType | Specifies view of your **Menstrual Cycle Widget**.                                                                                                                                                                                                                   | MenstrualCycleViewType.none |
| `title`                        | String                 | Specifies the title text of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                              |                             |
| `titleTextColor`               | Color                  | Specifies the title text color of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                        | Colors.black                |
| `titleTextSize`                | double                 | Specifies the title text size of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                         | 20                          |
| `titleFontWeight`              | FontWeight             | Specifies the title font weight of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                       | FontWeight.bold             |
| `message`                      | String                 | Specifies the message above title text of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                |                             |
| `message2`                     | String                 | Specifies the message below title text of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                |                             |
| `messageTextColor`             | Color                  | Specifies the message text color of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                      | Colors.black45              |
| `messageTextSize`              | double                 | Specifies the message text size of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                       | 10                          |
| `messageFontWeight`            | FontWeight             | Specifies the message font weight of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                                     | FontWeight.normal           |
| `spaceBtnTitleMessage`         | int                    | Specifies the space between title & message of your central view. **NOTE**: Only when viewType is **MenstrualCycleViewType.text** or **MenstrualCycleViewType.circleText**                                                                                           | 5                           |

### Theme example

| **MenstrualCycleTheme.basic**                                                                                                   | **MenstrualCycleTheme.arcs**                                                                                                   | **MenstrualCycleTheme.circle**                                                                                                    |
|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/basic.jpg?raw=true" height = "200px"> | <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/arcs.jpg?raw=true" height = "200px"> | <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/circle.jpg?raw=true"  height = "200px"> |

### Phase text boundaries example

|                                                                                                                                                                                                                                                                                                                                                                                                                              |
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
        themeColor: Colors.black,
        hideInfoView: false,
        daySelectedColor: Colors.blue,
        onDataChanged: (value) {},
      ),
    );
  }
}
```
### Parameters

| Parameters         | Datatype | Description                                                                            | Default Value |
|--------------------|----------|----------------------------------------------------------------------------------------|---------------|
| `themeColor`       | Color    | Specifies the theme color to match the app’s style                                     | "000000"      |
| `daySelectedColor` | Color    | Specifies the selected day color.                                                      | Colors.grey   |
| `hideInfoView`     | bool     | Set true to hide information view. Default is false                                    | false         |
| `onDataChanged`    | Function | Callback this function if change any data into calender view.                          | -             |
| `isShowCloseIcon`  | bool     | Set true to show (X) close icon on top left side of calender view. Default is false  . | false         |


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
        themeColor: Colors.black,
        daySelectedColor: Colors.blue,
        logPeriodText: "Log Period",
        backgroundColorCode: Colors.white,
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

| Parameters            | Datatype | Description                                                                | Default Value |
|-----------------------|----------|----------------------------------------------------------------------------|---------------|
| `themeColor`          | Color    | Specifies the theme color to match the app’s style                         | "000000"      |
| `daySelectedColor`    | Color    | Specifies the selected day color.                                          | Colors.grey   |
| `hideInfoView`        | bool     | Set true to hide information view. Default is false                        | false         |
| `onDataChanged`       | Function | Callback this function if change any data into calender view.              | -             |
| `logPeriodText`       | String   | Specifies text of your log period button.                                  | Log Period    |
| `backgroundColorCode` | Color    | Specifies the background color of your calender view to match app's style. | "ffffff"      |
| `hideBottomBar`       | bool     | Set true to hide bottom view of calender.                                  | false         |
| `hideLogPeriodButton` | bool     | Set true to hide log period button from calender.                          | false         |
| `isExpanded`          | bool     | Set true to show monthly style calender view.                              | false         |
| `onDateSelected`      | Function | Callback this function if tap on any date.                                 | -             |


### Example

| Example                                                                                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/week.jpeg?raw=true"  height = "300px"> <img src="https://github.com/sandipkalola/menstrual_cycle_widget_example/blob/main/assets/weeklyfull.jpeg?raw=true"  height = "300px"> |



## Bugs or Requests

If you encounter any problems feel free to open an [issue](https://github.com/sandipkalola/menstrual_cycle_widget/issues/new?template=bug_report.md). If you feel the library is missing a feature, please raise a [ticket](https://github.com/sandipkalola/menstrual_cycle_widget/issues/new?template=feature_request.md) on GitHub.


## Github example link
https://github.com/sandipkalola/menstrual_cycle_widget_example

## Donate
> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> - [PayPal](https://paypal.me/sandipkalola)
> - [GitHub Sponsors](https://github.com/sponsors/sandipkalola)
