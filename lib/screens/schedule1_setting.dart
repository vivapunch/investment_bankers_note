import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:investment_bankers_note/components/classification_data.dart';
import 'package:investment_bankers_note/components/constant.dart';
import 'package:investment_bankers_note/components/variables.dart';
import 'item_select.dart';
import 'schedule2_making.dart';

class ScheduleAssumptionPage extends StatefulWidget {
  const ScheduleAssumptionPage({super.key});

  @override
  State<ScheduleAssumptionPage> createState() => _ScheduleAssumptionPageState();
}

class _ScheduleAssumptionPageState extends State<ScheduleAssumptionPage> {
  late List<Widget> shownWidgetList = [];

  @override
  void initState() {
    List<Widget> widgetList = [];
    // if (PurposeActList().getIssueOrNot(selectedPurpose) ||
    //     PurposeActList().getPublicOrNot(selectedPurpose)) {
    //   shownWidgetList.add(widgetList[0]);
    //   shownWidgetList.add(widgetList[2]);
    //   if (PurposeActList().getPublicOrNot(selectedPurpose)) {
    //     shownWidgetList.add(widgetList[3]);
    //     shownWidgetList.add(widgetList[4]);
    //   }
    // } else {
    //   shownWidgetList.add(widgetList[1]);
    // }
    // shownWidgetList.add(widgetList[5]);
    super.initState();
  }

  void changeDate(DateTime variable, DateTime selected) {
    setState(() {
      variable = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일정 조건'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerStyle(
                contentWidget: timePickerRow(context,
                    labelText: '이사회 결의일', dateVariable: selectedBODDate)),
            ContainerStyle(
                contentWidget: timePickerRow(context,
                    labelText: '매매일', dateVariable: selectedTradingDate)),
            ContainerStyle(
              contentWidget: switchRow(context,
                  labelText: '상장 여부',
                  boolVariable: onPublic,
                  falseText: '비상장',
                  trueText: '상장'),
            ),
            ContainerStyle(
                contentWidget: dropdownRow(context,
                    menuList: settleMonths, labelText: '결산월')),
            ContainerStyle(
                contentWidget: dropdownRow(context,
                    menuList: reviseReports, labelText: '증권신고서 정정')),
            ContinueBox(
              buttonClick: () {
                Navigator.pushNamed(context, makeSchedule);
              },
            )
          ],
        ),
      ),
    );
  }

  Row dropdownRow(BuildContext context,
      {String labelText = '제목', required List<String> menuList}) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleContainer(labelText: labelText),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
            child: DropdownMenu<String>(
              inputDecorationTheme: const InputDecorationTheme(
                  filled: true,
                  fillColor: kBrightColor,
                  constraints: BoxConstraints(maxHeight: 35)),
              initialSelection:
                  labelText == '결산월' ? menuList.last : menuList.first,
              onSelected: (String? value) {
                if (labelText == '결산월') {
                  String monthName = value != null
                      ? value.substring(0, value.length - 1)
                      : '12';
                  settleMonth = int.parse(monthName);
                } else if (labelText == '증권신고서 정정') {
                  String numberName = value != null
                      ? value.substring(0, value.length - 1)
                      : '12';
                  reviseReportNum = int.parse(numberName);
                }
              },
              dropdownMenuEntries: menuList.map<DropdownMenuEntry<String>>(
                (String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                  );
                },
              ).toList(),
            ),
          ),
        ]);
  }

  Row switchRow(BuildContext context,
      {String labelText = '제목',
      bool boolVariable = false,
      String? falseText,
      String? trueText}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TitleContainer(labelText: labelText),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5),
          child: Text(
            falseText ?? '',
            style: const TextStyle(
              fontSize: 20,
              color: kBrightTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        CupertinoSwitch(
            activeColor: kBrightColor,
            trackColor: kBrightColor,
            thumbColor: kBasicColor1,
            value: boolVariable,
            onChanged: (value) {
              setState(() {
                if (labelText == '상장 여부') {
                  onPublic = value;
                }
              });
            }),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5),
          child: Text(
            trueText ?? '',
            style: const TextStyle(
              fontSize: 20,
              color: kBrightTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Row timePickerRow(BuildContext context,
      {String labelText = '제목', DateTime? dateVariable}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TitleContainer(labelText: labelText),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 5, 0, 5),
          padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: kBrightColor),
          child: Text(
            dateVariable != null
                ? dateVariable.toString().substring(0, 10)
                : '',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100))
                .then((selectedDate) {
              setState(() {
                if (labelText == '이사회 결의일') {
                  selectedBODDate = selectedDate ?? DateTime.now();
                } else if (labelText == '매매일') {
                  selectedTradingDate = selectedDate ?? DateTime.now();
                }
              });
            });
          },
          child: const Icon(
            Icons.edit_calendar,
            color: kBrightTextColor,
          ),
        ),
      ],
    );
  }
}

class ContainerStyle extends StatelessWidget {
  const ContainerStyle({super.key, required this.contentWidget});
  final Widget? contentWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: kBasicColor1),
        child: contentWidget);
  }
}

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key, required this.labelText});
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(10.0),
      child: Text(
        labelText,
        style: const TextStyle(
            fontSize: 20, color: kBrightTextColor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
