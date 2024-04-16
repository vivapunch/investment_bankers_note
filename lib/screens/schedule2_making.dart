import 'dart:ffi';
import 'package:investment_bankers_note/components/classification_data.dart';
import 'package:investment_bankers_note/components/classify_contract.dart';
import 'package:investment_bankers_note/components/schedule_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:investment_bankers_note/components/constant.dart';
import 'package:investment_bankers_note/components/variables.dart';

class MakeSchedule extends StatefulWidget {
  const MakeSchedule({super.key});

  @override
  State<MakeSchedule> createState() => _MakeScheduleState();
}

class _MakeScheduleState extends State<MakeSchedule> {
  late List<Widget> scheduleWidgetList;
  List<String> schduleList = ProcessList().getNameList();

  @override
  void initState() {
    scheduleWidgetList = [];
    ProcessList().processMap.forEach((processName, property) {
      // if (useOrNot(selectedPurpose, selectedRole, selectedObject,
      //     selectedDetailAlloc, selectedForfeit, property.usage)) {
      scheduleWidgetList.add(ScheduleSettingContainer(
        labelText: processName,
        standardDateList: property.standardDateList,
        rollingNumber: property.differentDays,
        periodType: property.periodType,
      ));
    }
        // },
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일정 수립'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: scheduleWidgetList,
        ),
      ),
    );
  }
}

class ScheduleSettingContainer extends StatelessWidget {
  const ScheduleSettingContainer({
    super.key,
    required this.labelText,
    required this.standardDateList,
    this.standardDateSelected,
    this.rollingNumber,
    this.periodType,
  });
  final String labelText;
  final List<String> standardDateList;
  final Function(String?)? standardDateSelected;
  final int? rollingNumber;
  final String? periodType;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: kBasicColor1),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                labelText,
                style: const TextStyle(
                    fontSize: 20,
                    color: kBrightTextColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                child: DropdownMenu<String>(
                  inputDecorationTheme: const InputDecorationTheme(
                      filled: true,
                      fillColor: kBrightColor,
                      constraints: BoxConstraints(maxHeight: 35)),
                  initialSelection: standardDateList.first,
                  onSelected: standardDateSelected,
                  dropdownMenuEntries:
                      standardDateList.map<DropdownMenuEntry<String>>(
                    (String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value,
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3)
                ],
              ),
            )
          ],
        ));
  }
}

bool useOrNot(String purposeAct, String iBRole, String contractObject,
    String alloc, String forfeit, WhenUse? usage) {
  if (usage == null) {
    return true; // If usage is not provided, consider it as usable
  }

  if (usage?.purposeActName != null && usage?.purposeActName != purposeAct) {
    return false;
  }
  if (usage?.purposeActdivision != null &&
      usage?.purposeActdivision != PurposeActList().getDivision(purposeAct)) {
    return false;
  }
  if (usage?.issue != null &&
      usage?.issue != PurposeActList().getIssueOrNot(purposeAct)) {
    return false;
  }
  if (usage?.public != null &&
      usage?.public != PurposeActList().getPublicOrNot(purposeAct)) {
    return false;
  }
  if (usage?.sell != null &&
      usage?.sell != PurposeActList().getSellOrNot(purposeAct)) {
    return false;
  }
  if (usage?.tenderOffer != null &&
      usage?.tenderOffer != PurposeActList().getTenderOfferOrNot(purposeAct)) {
    return false;
  }

  if (usage?.contractActName != null && usage?.contractActName != iBRole) {
    return false;
  }
  if (usage?.roleName != null &&
      usage?.roleName != IBRoleList().getRoleName(iBRole)) {
    return false;
  }
  if (usage?.recommend != null &&
      usage?.recommend != IBRoleList().getRecommendOrNot(iBRole)) {
    return false;
  }
  if (usage?.mandate != null &&
      usage?.mandate != IBRoleList().getMandateOrNot(iBRole)) {
    return false;
  }
  if (usage?.agent != null &&
      usage?.agent != IBRoleList().getAgentOrNot(iBRole)) {
    return false;
  }
  if (usage?.acquisition != null &&
      usage?.acquisition != IBRoleList().getAcquisitionOrNot(iBRole)) {
    return false;
  }

  if (usage?.securityName != null && usage?.securityName != contractObject) {
    return false;
  }
  if (usage?.securitySort != null &&
      usage?.securitySort != SecurityList().getSort(contractObject)) {
    return false;
  }
  if (usage?.securityInitial != null &&
      usage?.securityInitial != SecurityList().getInitial(contractObject)) {
    return false;
  }
  if (usage?.securityDivision != null &&
      usage?.securityDivision != SecurityList().getDivision(contractObject)) {
    return false;
  }
  if (usage?.stocks != null &&
      usage?.stocks != SecurityList().getStockOrNot(contractObject)) {
    return false;
  }

  if (usage?.allocationName != null && usage?.allocationName != alloc) {
    return false;
  }
  if (usage?.allocationMethod != null &&
      usage?.allocationMethod != AllocationList().getMethod(alloc)) {
    return false;
  }
  if (usage?.priorWhom != null &&
      usage?.priorWhom != AllocationList().getPriorWhom(alloc)) {
    return false;
  }
  if (usage?.overSubscription != null &&
      usage?.overSubscription != AllocationList().getOverSubscription(alloc)) {
    return false;
  }
  if (usage?.forESOP != null &&
      usage?.forESOP != AllocationList().getESOP(alloc)) {
    return false;
  }
  if (usage?.newStocks != null &&
      usage?.newStocks != AllocationList().getNewStocksOrNot(alloc)) {
    return false;
  }

  if (usage?.forfeitName != null && usage?.forfeitName != forfeit) {
    return false;
  }
  if (usage?.forfeitAcquisition != null &&
      usage?.forfeitAcquisition != ForfeitList().getAcquisitionOrNot(forfeit)) {
    return false;
  }
  if (usage?.disposal != null &&
      usage?.disposal != ForfeitList().getDisposal(forfeit)) {
    return false;
  }
  return true; // If all conditions are satisfied, return true
}
