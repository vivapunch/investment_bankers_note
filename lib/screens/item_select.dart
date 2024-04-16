import 'dart:collection';
import 'package:investment_bankers_note/components/classification_data.dart';
import 'package:investment_bankers_note/components/variables.dart';
import 'package:flutter/material.dart';
import 'package:investment_bankers_note/components/constant.dart';

var buildQueue = ListQueue();

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  late int contentIndex;
  late Widget buildContent;
  List<Widget> buildContents = [
    const ContractActItem(),
    const AllocationItem(),
    const AdvisoryPurposeItem(),
  ];

  @override
  void initState() {
    super.initState();
    contentIndex = 0;
    buildContent = buildContents[contentIndex];
  }

  void changeWidget(int index) {
    setState(() {
      buildContent = buildContents[index];
    });
  }

  void changePage() async {
    await Navigator.pushNamed(context, selectedWork);
    contentIndex = 0;
    changeWidget(contentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms&Conditions'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: buildContent,
          ),
          ContinueBox(buttonClick: () {
            if (contentIndex == 0) {
              if (SecurityList().getStockOrNot(selectedObject) &&
                  PurposeActList().getIssueOrNot(selectedAct)) {
                newStocks = true;
                buildQueue.add(1);
              } else {
                newStocks = false;
              }
              if (selectedRole == '자문') {
                advisoryOrNot = true;
                buildQueue.add(2);
              } else {
                advisoryOrNot = false;
                selectedPurpose = advisePurposeList.first;
              }
            }
            if (buildQueue.isEmpty) {
              changePage();
            } else {
              contentIndex = buildQueue.removeFirst();
              changeWidget(contentIndex);
            }
          }),
        ],
      )),
    );
  }
}

class ContractActItem extends StatefulWidget {
  const ContractActItem({super.key});

  @override
  State<ContractActItem> createState() => _ContractActItemState();
}

class _ContractActItemState extends State<ContractActItem> {
  late List<String> roleList;

  @override
  void initState() {
    roleList = ibRoleList;
    super.initState();
  }

  void changeRolelList(String purposeAct) {
    setState(() {
      if (PurposeActList().getIssueOrNot(purposeAct)) {
        roleList = ibRoleList;
        selectedRole = ibRoleList.first;
      } else {
        roleList = securityCompanyRoleList;
        selectedRole = securityCompanyRoleList.first;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        dropDonwMenuBox(securityList,
            labelText: '대상물',
            firstMenu: selectedObject, onSelected: (String? value) {
          selectedObject = value!;
        }),
        dropDonwMenuBox(purposeActList,
            labelText: '목적 행위',
            firstMenu: selectedAct, onSelected: (String? value) {
          setState(() {
            selectedAct = value!;
            changeRolelList(selectedAct);
          });
        }),
        dropDonwMenuBox(roleList, labelText: '계약 행위', firstMenu: selectedRole,
            onSelected: (String? value) {
          selectedRole = value!;
        }),
      ],
    );
  }
}

class AllocationItem extends StatefulWidget {
  const AllocationItem({super.key});

  @override
  State<AllocationItem> createState() => _AllocationItemState();
}

class _AllocationItemState extends State<AllocationItem> {
  late List<String> allocDetailList;
  late Widget forfeitDropdownBox;

  @override
  void initState() {
    allocDetailList = AllocationList().getNameList(newStocks: true);
    selectedDetailAlloc = allocDetailList.first;
    if (selectedRole == '잔액인수' || selectedRole == '총액인수') {
      selectedForfeit = forfeitList.first;
      forfeitDropdownBox = dropDonwMenuBox(forfeitList,
          labelText: '실권주 처리 방법',
          firstMenu: selectedForfeit, onSelected: (String? value) {
        selectedForfeit = value!;
      });
    } else {
      selectedForfeit = '미발행';
      forfeitDropdownBox = const SizedBox.shrink();
    }
    super.initState();
  }

  void changeDetailList(String allocMethod) {
    setState(() {
      allocDetailList =
          AllocationList().getNameList(method: allocMethod, newStocks: true);
      selectedDetailAlloc = allocDetailList.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        dropDonwMenuBox(allocList, labelText: '신주의 배정 방법',
            onSelected: (String? value) {
          setState(() {
            selectedAlloc = value!; // 선택된 신주의 배정 방법 업데이트
            changeDetailList(selectedAlloc); // 세부 배정 방법 목록 업데이트
          });
        }),
        dropDonwMenuBox(allocDetailList, labelText: '세부 배정 방법',
            onSelected: (String? value) {
          selectedDetailAlloc = value!;
        }),
        forfeitDropdownBox,
      ],
    );
  }
}

class AdvisoryPurposeItem extends StatefulWidget {
  const AdvisoryPurposeItem({super.key});

  @override
  State<AdvisoryPurposeItem> createState() => _AdvisoryPurposeItemState();
}

class _AdvisoryPurposeItemState extends State<AdvisoryPurposeItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        dropDonwMenuBox(advisePurposeList,
            firstMenu: selectedPurpose,
            labelText: '자문의 목적', onSelected: (String? value) {
          selectedPurpose = value!;
        }),
      ],
    );
  }
}

Container dropDonwMenuBox(List<String> menuList,
    {String labelText = '제목',
    Function(String? value)? onSelected,
    String? firstMenu}) {
  return Container(
    margin: EdgeInsets.all(marginSize),
    child: DropdownMenu<String>(
      width: boxWidth,
      initialSelection: firstMenu != null ? firstMenu : menuList.first,
      label: Text(labelText),
      onSelected: onSelected,
      dropdownMenuEntries: menuList.map<DropdownMenuEntry<String>>(
        (String value) {
          return DropdownMenuEntry<String>(
            value: value,
            label: value,
          );
        },
      ).toList(),
    ),
  );
}

class ContinueBox extends StatelessWidget {
  const ContinueBox({super.key, this.buttonClick});
  final Function()? buttonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(marginSize),
      decoration: BoxDecoration(
          color: kHighlightColor1, borderRadius: BorderRadius.circular(5.0)),
      width: boxWidth,
      child: TextButton(
        onPressed: buttonClick,
        child: const Text(
          '계속',
          style: TextStyle(
              color: kBrightTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 20.0),
        ),
      ),
    );
  }
}
