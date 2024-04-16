import 'package:flutter/material.dart';
import 'package:investment_bankers_note/components/classification_data.dart';

const String selectPage = '/selectPage';
const String chooseWork = '/chooseWork';
const String setSchedule = '/setSchedule';
const String makeSchedule = '/makeSchedule';
const String makeProposal = '/makeProposal';
const String writeContract = '/writeContract';

const Color kDarkTextColor = Color(0xDD000000);
const Color kBrightTextColor = Color(0xFFFFFFFF);
const Color kBrightColor = Color(0xFFFAFAFA);
const Color kDarkColor = Color(0xFF3081D0);

const Color kHighlightColor1 = Color(0xFF3081D0);
const Color kBasicColor1 = Color(0xFF6DB9EF);
const Color kHighlightColor2 = Color(0xFFF4F27E);
const Color kBasicColor2 = Color(0xFFFFF5C2);

final List<String> purposeActList = PurposeActList().getNameList();
final List<String> contractActList = IBRoleList().getNameList();
final List<String> ibRoleList = IBRoleList().getIBRoleSet();
final List<String> securityCompanyRoleList = IBRoleList().getNameList();
final List<String> securityList = SecurityList().getNameList(contain: true);
final List<String> allocList = AllocationList().getMethodSet(newStocks: true);
final List<String> forfeitList = ForfeitList().getNameList(acquisition: true);
final List<String> advisePurposeList = [
  '자금조달',
  '합병',
  '분할',
  '분할합병',
  '포괄적 주식교환',
  '포괄적 주식이전',
  'M&A',
  '지주회사 전환',
  '상장폐지',
  '기타'
];

final List<String> settleMonths = [
  '1월',
  '2월',
  '3월',
  '4월',
  '5월',
  '6월',
  '7월',
  '8월',
  '9월',
  '10월',
  '11월',
  '12월'
];

final List<String> reviseReports = ['0회', '1회', '2회', '3회', '4회', '5회'];
