# menstrual_cycle_widget

**Menstrual Cycle Widget** is a comprehensive and customizable widget designed to help users to show their menstrual cycles seamlessly. It is built with Flutter, allowing easy integration into any Flutter application. This widget provides an intuitive interface, essential features, and insightful visualizations to support users in understanding their menstrual days.

# How to Use

### 1. Installation
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  menstrual_cycle_widget: ^0.0.3
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```css
$ pub get
```

with `Flutter`:

```css
$ flutter packages get
```

### 3. Basic Implementation

Now in your `Dart` code, you can use:

```dart
import 'package:menstrual_cycle_widget/menstrual_cycle_phase_view.dart';

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
# Required Parameters
- **size** (required): Specifies the overall size of the **MenstrualCyclePhaseView** widget.
- **totalCycleDays** (required): Sets the total number of days in the menstrual cycle.
- **menstruationDayCount** (required): Defines the number of days for the menstruation phase.
- **follicularDayCount** (required): Defines the number of days for the follicular phase.
- **ovulationDayCount** (required): Defines the number of days for the ovulation phase.

# Optional Parameters
- **imgSize**: Specifies the size of the image in the central circle. Default is **30**.
- **imageAssets**: Sets the image to be displayed inside the central circle.

- **centralCircleBackgroundColor**: Sets the background color of the central circle. Default is **'Color(0xffed9dba)'**.
- **centralCircleSize**: Specifies the size of the central circle. Default is **25**.

- **dayFontSize**: Specifies the font size of the day numbers (1, 2, 3, etc.). Default is **12**.
- **dayTextColor**: Specifies the text color of the day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.
- **dayTitle**: Allows replacing the default 'Day' title text with a new title. Default is **'Day'**.
- **dayTitleFontSize**: Specifies the font size of the 'Day' title text. Default is **5**.
- **isShowDayTitle**: Controls the visibility of the 'Day' title. Set to false to hide it. Default is **true**.

- **menstruationBackgroundColor**: Sets the background color for the menstruation phase. Default is **'Color(0x26ff584f)'**.
- **menstruationColor**: Sets the color for the menstruation phase. Default is **'Color(0xFFff584f)'**.
- **menstruationDayTextColor**: Specifies the text color of the menstruation day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.
- **menstruationName**: Specifies the menstruation phase name. Default is **'Menstruation'**.
- **menstruationTextColor**: Specifies the text color of menstruation phase name. Default is **'Color(0xFFff584f)'**.

- **follicularBackgroundColor**: Sets the background color for the follicular phase. Default is **'Color(0x26eec9b7)'**.
- **follicularPhaseColor**: Sets the color for the follicular phase. Default is **'Color(0xFFeec9b7)'**.
- **follicularPhaseDayTextColor**: Specifies the text color of the follicular day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.
- **follicularPhaseName**: Specifies the follicular phase name. Default is **'Follicular phase'**.
- **follicularTextColor**: Specifies the text color of follicular phase name. Default is **'Color(0xFFeec9b7)'**.

- **ovulationBackgroundColor**: Sets the background color for the ovulation phase. Default is **'Color(0x2622bc79)'**.
- **ovulationColor**: Sets the color for the ovulation phase. Default is **'Color(0xFF22bc79)'**.
- **ovulationDayTextColor**: Specifies the text color of the ovulation day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.
- **ovulationName**: Specifies the ovulation phase name. Default is **'Ovulation'**.
- **ovulationTextColor**: Specifies the text color of ovulation phase name. Default is **'Color(0xFF22bc79)'**.

- **lutealPhaseBackgroundColor**: Sets the background color for the luteal phase. Default is **'Color(0x26abcdf0)'**.
- **lutealPhaseColor**: Sets the color for the luteal phase. Default is **'Color(0xFFabcdf0)'**.
- **lutealPhaseDayTextColor**: Specifies the text color of the luteal day numbers (1, 2, 3, etc.). Default is **'Colors.black'**.
- **lutealPhaseName**: Specifies the follicular phase name. Default is **'Luteal phase'**.
- **lutealPhaseTextColor**: Specifies the text color of follicular phase name. Default is **'Color(0xFFabcdf0)'**.

- **phasesTextSize**: Specifies font size of the phase days ('Menstruation', 'Follicular phase', 'Ovulation' and 'Luteal phase'). Default is 8.

- **selectedDay**: Specifies the current day of **'Menstrual Cycle Phase'**.
- **selectedDayBackgroundColor**: Specifies the circle background of selected day. Default is **white**.
- **selectedDayCircleBorderColor**: Specifies the circle border color of selected day. Default is based on selected day's background color.
- **selectedDayCircleSize**: Specifies the circle size of selected day. Default is **18**.
- **selectedDayTextColor**: Specifies the text color of the selected day. Default is **'Colors.black'**.
- **selectedDayFontSize** : Specifies the font size of the selected day.
- **dayFontWeight** : Specifies the font weight of the day. Default is **FontWeight.normal**

- **circleDaySize** : Specifies the size of the circle. NOTE: Only when Theme is MenstrualCycleTheme.circle
- **theme** : Specifies the theme of your menstrual widget . Default id **'MenstrualCycleTheme.basic'**


# Theme example

**1) MenstrualCycleTheme.basic**
- <img src="https://github.com/sandipkalola/menstrual_cycle_widget/blob/master/menstrual_cycle_widget_example/assets/basic.jpg?raw=true" height = "400px">

**2) MenstrualCycleTheme.arcs**
- <img src="https://github.com/sandipkalola/menstrual_cycle_widget/blob/master/menstrual_cycle_widget_example/assets/arcs.jpg?raw=true" height = "400px">

**3) MenstrualCycleTheme.circle**
- <img src="https://github.com/sandipkalola/menstrual_cycle_widget/blob/master/menstrual_cycle_widget_example/assets/circle.jpg?raw=true"  height = "400px">



# Bugs or Requests

If you encounter any problems feel free to open an [issue](https://github.com/sandipkalola/menstrual_cycle_widget/issues/new?template=bug_report.md). If you feel the library is missing a feature, please raise a [ticket](https://github.com/sandipkalola/menstrual_cycle_widget/issues/new?template=feature_request.md) on GitHub.


## Github example link
https://github.com/sandipkalola/menstrual_cycle_widget

# Donate
> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> - [PayPal](https://paypal.me/sandipkalola)
