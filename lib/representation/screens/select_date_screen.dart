import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/representation/widgets/appbar_container.dart';
import 'package:travel/representation/widgets/button_widget.dart';

class SelectDateScreen extends StatelessWidget {
  // const SelectDateScreen(
  //     {Key? key, required this.rangeEndDate, required this.rangeStartDate})
  //     : super(key: key);
  static final String routeName = '/select_date_screen';
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Select date',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
            },
          ),
          ButtonWidget(
            title: 'Select',
            ontap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            ontap: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
